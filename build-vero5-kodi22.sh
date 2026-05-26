#!/usr/bin/env bash
set -euo pipefail

if [ "${EUID}" -eq 0 ]; then
    echo "Run this as your normal user. The OSMC build will use sudo when needed."
    exit 1
fi

if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    echo "Run this from inside the OSMC Git checkout."
    exit 1
fi

repo_root="$(git rev-parse --show-toplevel)"
cd "${repo_root}"

git pull --ff-only

mediacenter_dir="${repo_root}/package/mediacenter-osmc"
kodi_src_dir="${mediacenter_dir}/src/xbmc-22.0a3-Piers"
build_sh="${mediacenter_dir}/build.sh"

if ! grep -q -- '-DENABLE_INTERNAL_ASS=OFF' "${build_sh}"; then
    echo "Adding Vero 5 Kodi 22 ASS system-library flag to local build.sh"
    python3 - <<'PY'
from pathlib import Path

path = Path('package/mediacenter-osmc/build.sh')
text = path.read_text()
marker = '        if [ "$1" == "vero5" ]; then\n'
idx = text.index(marker)
head = text[:idx]
tail = text[idx:]
old = '            -DENABLE_APP_AUTONAME=OFF \\\n            -DENABLE_INTERNAL_FMT=OFF \\\n'
new = '            -DENABLE_APP_AUTONAME=OFF \\\n            -DENABLE_INTERNAL_ASS=OFF \\\n            -DENABLE_INTERNAL_FMT=OFF \\\n'
if old not in tail:
    raise SystemExit('Could not find Vero 5 internal dependency flag block in build.sh')
path.write_text(head + tail.replace(old, new, 1))
PY
fi

if [ -d "${kodi_src_dir}/kodi-build" ]; then
    echo "Removing stale Kodi CMake build directory"
    rm -rf "${kodi_src_dir}/kodi-build"
fi

find "${mediacenter_dir}/src" -path '*/kodi-build/CMakeCache.txt' -print -delete 2>/dev/null || true
find "${mediacenter_dir}/src" -path '*/kodi-build/CMakeFiles' -type d -print -exec rm -rf {} + 2>/dev/null || true

cd "${mediacenter_dir}"
make vero5
