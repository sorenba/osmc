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

echo "Patching local Vero 5 Kodi 22 build flags"
python3 - <<'PY'
from pathlib import Path

path = Path('package/mediacenter-osmc/build.sh')
text = path.read_text()
marker = '        if [ "$1" == "vero5" ]; then\n'
idx = text.index(marker)
head = text[:idx]
tail = text[idx:]

if '-DENABLE_INTERNAL_ASS=OFF' not in tail:
    old = '            -DENABLE_APP_AUTONAME=OFF \\\n            -DENABLE_INTERNAL_FMT=OFF \\\n'
    new = '            -DENABLE_APP_AUTONAME=OFF \\\n            -DENABLE_INTERNAL_ASS=OFF \\\n            -DENABLE_INTERNAL_FMT=OFF \\\n'
    if old not in tail:
        raise SystemExit('Could not find Vero 5 internal dependency flag block in build.sh')
    tail = tail.replace(old, new, 1)

if 'arm-linux-gnueabihf/pkgconfig' not in tail:
    old = '        export LDFLAGS="-L/opt/vero5/lib" && \\\n'
    new = '        export LDFLAGS="-L/opt/vero5/lib" && \\\n        export PKG_CONFIG_PATH="/usr/lib/arm-linux-gnueabihf/pkgconfig:/usr/share/pkgconfig:/usr/osmc/lib/pkgconfig:/opt/vero5/lib/pkgconfig:${PKG_CONFIG_PATH:-}" && \\\n'
    if old not in tail:
        raise SystemExit('Could not find Vero 5 LDFLAGS export in build.sh')
    tail = tail.replace(old, new, 1)

path.write_text(head + tail)
PY

if ! grep -q -- '-DENABLE_INTERNAL_ASS=OFF' "${build_sh}"; then
    echo "Failed to add -DENABLE_INTERNAL_ASS=OFF to build.sh"
    exit 1
fi

if ! grep -q -- 'arm-linux-gnueabihf/pkgconfig' "${build_sh}"; then
    echo "Failed to add Vero 5 PKG_CONFIG_PATH to build.sh"
    exit 1
fi

echo "Patched Vero 5 configure block:"
sed -n '/if \[ "\$1" == "vero5" \]/,/^        fi/p' "${build_sh}" | grep -E 'PKG_CONFIG_PATH|ENABLE_INTERNAL_ASS|ENABLE_INTERNAL_FMT|cmake|LDFLAGS|vero5'

if [ -d "${kodi_src_dir}/kodi-build" ]; then
    echo "Removing stale Kodi CMake build directory"
    sudo rm -rf "${kodi_src_dir}/kodi-build"
fi

find "${mediacenter_dir}/src" -path '*/kodi-build/CMakeCache.txt' -print -exec sudo rm -f {} \; 2>/dev/null || true
find "${mediacenter_dir}/src" -path '*/kodi-build/CMakeFiles' -type d -print -exec sudo rm -rf {} + 2>/dev/null || true

cd "${mediacenter_dir}"
make vero5
