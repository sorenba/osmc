#!/usr/bin/env python3
import argparse
import re
import shutil
import zipfile
from pathlib import Path


def safe_name(path: str) -> str:
    text = path.strip().replace('b/', '', 1)
    text = re.sub(r'[^A-Za-z0-9._-]+', '-', text).strip('-')
    return text or 'patch'


def split_patch(input_patch: Path, output_dir: Path, zip_path: Path | None) -> int:
    text = input_patch.read_text(encoding='utf-8', errors='replace').splitlines(keepends=True)

    starts: list[int] = []
    for i, line in enumerate(text):
        if line.startswith('diff --git '):
            starts.append(i)

    if not starts:
        raise SystemExit(f'No top-level diff chunks found in {input_patch}')

    if output_dir.exists():
        shutil.rmtree(output_dir)
    output_dir.mkdir(parents=True, exist_ok=True)

    chunks: list[tuple[str, str]] = []
    for idx, start in enumerate(starts, start=1):
        end = starts[idx] if idx < len(starts) else len(text)
        chunk = ''.join(text[start:end])
        first = text[start].strip().split()
        target = first[3] if len(first) >= 4 else f'chunk-{idx:03d}'
        name = f'vero5-split-{idx:03d}-{safe_name(target)}.patch'
        (output_dir / name).write_text(chunk, encoding='utf-8')
        chunks.append((name, target))

    readme = output_dir / 'README.md'
    readme.write_text(
        '# Vero 5 patch split\n\n'
        'Generated from `package/mediacenter-osmc/patches/vero5-000-add-vero-support.patch`.\n\n'
        'Each file contains one top-level `diff --git` chunk from the original patch.\n'
        'Embedded patch files inside added files are kept inside their parent chunk.\n\n'
        '## Files\n\n'
        + ''.join(f'- `{name}` -> `{target}`\n' for name, target in chunks),
        encoding='utf-8',
    )

    if zip_path is not None:
        if zip_path.exists():
            zip_path.unlink()
        zip_path.parent.mkdir(parents=True, exist_ok=True)
        with zipfile.ZipFile(zip_path, 'w', compression=zipfile.ZIP_DEFLATED) as zf:
            for path in sorted(output_dir.rglob('*')):
                if path.is_file():
                    zf.write(path, path.relative_to(output_dir.parent))

    return len(chunks)


def main() -> None:
    parser = argparse.ArgumentParser(description='Split the Vero 5 Kodi patch into top-level diff chunks.')
    parser.add_argument('--input', default='package/mediacenter-osmc/patches/vero5-000-add-vero-support.patch')
    parser.add_argument('--output-dir', default='package/mediacenter-osmc/patches/vero5-split')
    parser.add_argument('--zip', default='package/mediacenter-osmc/patches/vero5-split-patches.zip')
    args = parser.parse_args()

    count = split_patch(Path(args.input), Path(args.output_dir), Path(args.zip) if args.zip else None)
    print(f'Wrote {count} split patch files to {args.output_dir}')
    if args.zip:
        print(f'Wrote {args.zip}')


if __name__ == '__main__':
    main()
