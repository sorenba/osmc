#!/usr/bin/env bash
set -euo pipefail

OSMC_KEY="553B25A766C762CC"
OSMC_LIST="/etc/apt/sources.list.d/osmc.list"
OSMC_REPO_LINE="deb https://apt.osmc.tv bullseye-devel main"
DUMMY_DIR="${HOME}/.cache/osmc-qemu-dummy"
OS_ID="unknown"
OS_VERSION_ID="unknown"
SUPPORTED_OS="0"

if [ "${EUID}" -eq 0 ]; then
    echo "Run this as your normal user. The script will use sudo when needed."
    exit 1
fi

if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    repo_root="$(git rev-parse --show-toplevel)"
    cd "${repo_root}"
    git pull --ff-only
else
    echo "Warning: not running inside a Git checkout; skipping git pull."
fi

if [ -r /etc/os-release ]; then
    . /etc/os-release
    OS_ID="${ID:-unknown}"
    OS_VERSION_ID="${VERSION_ID:-unknown}"
fi

case "${OS_ID}:${OS_VERSION_ID}" in
    debian:12|ubuntu:24.04)
        SUPPORTED_OS="1"
        ;;
esac

if [ "${SUPPORTED_OS}" != "1" ]; then
    echo "This setup script supports Debian 12 and Ubuntu 24.04 only. Detected ${OS_ID} ${OS_VERSION_ID}."
    exit 1
fi

sudo -v

sudo rm -f "${OSMC_LIST}"
sudo rm -f /etc/apt/apt.conf.d/99osmc-allow-weak-repository
sudo rm -f /etc/apt/sources.list.d/osmc*.list
sudo rm -f /var/lib/apt/lists/*apt.osmc.tv* /var/lib/apt/lists/*ftp.fau.de_osmc* 2>/dev/null || true

echo "${OSMC_REPO_LINE}" | sudo tee "${OSMC_LIST}" > /dev/null
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys "${OSMC_KEY}"

sudo apt update
sudo apt install -y ca-certificates gnupg dirmngr wget git build-essential fakeroot devscripts equivs rsync texinfo libncurses-dev whois bc cpio python3 python-is-python3 bison flex libssl-dev pkg-config unzip xz-utils subversion qemu-user qemu-user-static binfmt-support

if apt-cache policy qemu | grep -q 'Candidate: (none)'; then
    echo "Creating local dummy qemu package."
    mkdir -p "${DUMMY_DIR}"
    cd "${DUMMY_DIR}"
    printf '%s\n' \
        'Section: misc' \
        'Priority: optional' \
        'Standards-Version: 3.9.2' \
        'Package: qemu' \
        'Version: 1:99' \
        'Maintainer: local <local@example.com>' \
        'Architecture: all' \
        'Depends: qemu-user, qemu-user-static, binfmt-support' \
        'Description: Dummy qemu package for OSMC toolchain dependency' \
        ' Provides the old qemu package name for builds that depend on it.' \
        > qemu-dummy.control
    equivs-build qemu-dummy.control
    sudo apt install -y ./qemu_99_all.deb
    cd - >/dev/null
else
    sudo apt install -y qemu
fi

sudo apt install -y armv7-toolchain-osmc

if ! dpkg -s armv7-toolchain-osmc >/dev/null 2>&1; then
    echo "armv7-toolchain-osmc is still not installed."
    exit 1
fi

echo "Setup complete."
echo "From your OSMC checkout, build with:"
echo "  bash build-vero5-kodi22.sh"
