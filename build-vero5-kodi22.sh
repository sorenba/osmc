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

echo "Patching local Vero 5 Kodi 22 build dependencies"
python3 - <<'PY'
from pathlib import Path

path = Path('package/mediacenter-osmc/build.sh')
text = path.read_text()
marker = '\thandle_dep "libdisplay-info-dev"\n'
insert = ''.join([
    '\thandle_dep "libexiv2-dev"\n',
    '\thandle_dep "libharfbuzz-dev"\n',
    '\thandle_dep "libpcre2-dev"\n',
    '\thandle_dep "nlohmann-json3-dev"\n',
])

if 'handle_dep "libexiv2-dev"' not in text:
    if marker not in text:
        raise SystemExit('Could not find dependency insertion point in build.sh')
    text = text.replace(marker, marker + insert, 1)

path.write_text(text)
PY

for dep in libexiv2-dev libharfbuzz-dev libpcre2-dev nlohmann-json3-dev; do
    if ! grep -q -- "handle_dep \"${dep}\"" "${build_sh}"; then
        echo "Failed to add ${dep} to build.sh"
        exit 1
    fi
done

if [ -d "${kodi_src_dir}/kodi-build" ]; then
    echo "Removing stale Kodi CMake build directory"
    sudo rm -rf "${kodi_src_dir}/kodi-build"
fi

find "${mediacenter_dir}/src" -path '*/kodi-build/CMakeCache.txt' -print -exec sudo rm -f {} \; 2>/dev/null || true
find "${mediacenter_dir}/src" -path '*/kodi-build/CMakeFiles' -type d -print -exec sudo rm -rf {} + 2>/dev/null || true

cd "${mediacenter_dir}"
make vero5
