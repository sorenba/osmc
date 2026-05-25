#!/usr/bin/env bash
set -euo pipefail

REPO_URL="https://github.com/sorenba/osmc.git"
BRANCH="kodi-22"
BUILD_ROOT="${HOME}/kodi22-build"
REPO_DIR="${BUILD_ROOT}/osmc"

mkdir -p "${BUILD_ROOT}"

if [ -d "${REPO_DIR}/.git" ]; then
    echo "Using existing repository: ${REPO_DIR}"
    cd "${REPO_DIR}"
    git fetch origin
else
    echo "Cloning ${REPO_URL} to ${REPO_DIR}"
    git clone "${REPO_URL}" "${REPO_DIR}"
    cd "${REPO_DIR}"
fi

git checkout "${BRANCH}"
git pull --ff-only origin "${BRANCH}"

echo "Ready: ${REPO_DIR} on branch ${BRANCH}"
echo "Build command:"
echo "  cd ${REPO_DIR}/package/mediacenter-osmc"
echo "  make vero5"
