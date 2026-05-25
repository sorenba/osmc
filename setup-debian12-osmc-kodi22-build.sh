#!/usr/bin/env bash
set -euo pipefail

EXPECTED_VERSION_ID="12"
OSMC_KEY="553B25A766C762CC"
OSMC_KEYRING="/usr/share/keyrings/osmc-archive-keyring.gpg"
OSMC_LIST="/etc/apt/sources.list.d/osmc.list"
OSMC_REPO_LINE="deb [signed-by=${OSMC_KEYRING}] https://apt.osmc.tv bullseye-devel main"
BUILD_ROOT="${HOME}/kodi22-build"
REPO_URL="https://github.com/sorenba/osmc.git"
BRANCH="kodi-22"
REPO_DIR="${BUILD_ROOT}/osmc"

if [ "${EUID}" -eq 0 ]; then
    echo "Run this as your normal user. The script will use sudo when needed."
    exit 1
fi

if [ -r /etc/os-release ]; then
    . /etc/os-release
    if [ "${ID:-}" != "debian" ]; then
        echo "Warning: this script is intended for Debian ${EXPECTED_VERSION_ID}. Detected ID=${ID:-unknown}."
    fi
    if [ "${VERSION_ID:-}" != "${EXPECTED_VERSION_ID}" ]; then
        echo "Warning: this script is intended for Debian ${EXPECTED_VERSION_ID}. Detected VERSION_ID=${VERSION_ID:-unknown}."
    fi
fi

sudo -v

sudo apt update
sudo apt install -y ca-certificates gnupg dirmngr wget git build-essential fakeroot devscripts equivs rsync texinfo libncurses-dev whois bc cpio python3 python-is-python3 bison flex libssl-dev unzip xz-utils subversion qemu qemu-user qemu-user-static binfmt-support

tmp_gnupg="$(mktemp -d)"
cleanup() {
    rm -rf "${tmp_gnupg}"
}
trap cleanup EXIT
chmod 700 "${tmp_gnupg}"

gpg --homedir "${tmp_gnupg}" --batch --keyserver hkps://keyserver.ubuntu.com --recv-keys "${OSMC_KEY}"
gpg --homedir "${tmp_gnupg}" --batch --export "${OSMC_KEY}" | sudo gpg --dearmor --yes -o "${OSMC_KEYRING}"
sudo chmod 644 "${OSMC_KEYRING}"

echo "${OSMC_REPO_LINE}" | sudo tee "${OSMC_LIST}" > /dev/null
sudo apt update

if ! apt-cache policy armv7-toolchain-osmc | grep -q 'Candidate:'; then
    echo "armv7-toolchain-osmc was not found in APT metadata. Check ${OSMC_LIST}."
    exit 1
fi

if apt-cache policy armv7-toolchain-osmc | grep -q 'Candidate: (none)'; then
    echo "armv7-toolchain-osmc has no install candidate. Check ${OSMC_LIST}."
    exit 1
fi

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

echo "Setup complete."
echo "Build command:"
echo "  cd ${REPO_DIR}/package/mediacenter-osmc"
echo "  make vero5"
