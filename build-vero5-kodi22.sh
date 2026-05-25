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

cd package/mediacenter-osmc
make vero5
