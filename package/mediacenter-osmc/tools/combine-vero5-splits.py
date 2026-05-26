#!/usr/bin/env python3
import argparse
import re
from pathlib import Path


SPLIT_RE = re.compile(r'^vero5-split-(\d+)-.*\.patch$')


def split_index(path: Path) -> int:
    match = SPLIT_RE.match(path.name)
    if match is None:
        raise ValueError(f'Invalid split patch filename: {path.name}')
    return int(match.group(1))


def read_split_patch(path: Path) -> str:
    text = path.read_text(encoding='utf-8', errors='replace')
    if not text.startswith('diff --git ') and not text.startswith('--- a/'):
        raise ValueError(f'Split patch does not look like a patch: {path}')
    return text.rstrip('\n') + '\n'


def combine_patches(input_dir: Path, output_patch: Path) -> int:
    if not input_dir.is_dir():
        raise SystemExit(f'Split patch directory not found: {input_dir}')

    patches = sorted(input_dir.glob('vero5-split-*.patch'), key=split_index)
    if not patches:
        raise SystemExit(f'No split patch files found in {input_dir}')

    indexes = [split_index(path) for path in patches]
    expected = list(range(1, len(indexes) + 1))
    if indexes != expected:
        missing = sorted(set(expected) - set(indexes))
        raise SystemExit(f'Split patch indexes are not contiguous. Missing: {missing}')

    combined = ''.join(read_split_patch(path) + '\n' for path in patches).rstrip('\n') + '\n'

    output_patch.parent.mkdir(parents=True, exist_ok=True)
    output_patch.write_text(combined, encoding='utf-8')
    return len(patches)


def main() -> None:
    parser = argparse.ArgumentParser(description='Combine Vero 5 split patches back into the original patch file.')
    parser.add_argument('--input-dir', default='package/mediacenter-osmc/patches/vero5-split')
    parser.add_argument('--output', default='package/mediacenter-osmc/patches/vero5-000-add-vero-support.patch')
    args = parser.parse_args()

    count = combine_patches(Path(args.input_dir), Path(args.output))
    print(f'Combined {count} split patch files')
    print(f'Overwrote {args.output}')


if __name__ == '__main__':
    main()
