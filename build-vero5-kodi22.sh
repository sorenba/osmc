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

if [ -d "${kodi_src_dir}/kodi-build" ]; then
    echo "Removing stale Kodi CMake build directory"
    sudo rm -rf "${kodi_src_dir}/kodi-build"
fi

find "${mediacenter_dir}/src" -path '*/kodi-build/CMakeCache.txt' -print -exec sudo rm -f {} \; 2>/dev/null || true
find "${mediacenter_dir}/src" -path '*/kodi-build/CMakeFiles' -type d -print -exec sudo rm -rf {} + 2>/dev/null || true

cd "${mediacenter_dir}"
make vero5
