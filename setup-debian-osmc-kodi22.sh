#!/usr/bin/env bash
set -euo pipefail

OSMC_KEY="553B25A766C762CC"
OSMC_KEYRING="/usr/share/keyrings/osmc-archive-keyring.gpg"
OSMC_LIST="/etc/apt/sources.list.d/osmc.list"
OSMC_APT_WEAK_CONF="/etc/apt/apt.conf.d/99osmc-allow-weak-repository"
OSMC_REPO_LINE="deb [signed-by=${OSMC_KEYRING}] https://apt.osmc.tv bullseye-devel main"
DUMMY_DIR="${HOME}/.cache/osmc-qemu-dummy"
DEBIAN_VERSION_ID="unknown"

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
    DEBIAN_VERSION_ID="${VERSION_ID:-unknown}"
    if [ "${ID:-}" != "debian" ]; then
        echo "Warning: this script is intended for Debian 12 or Debian 13. Detected ID=${ID:-unknown}."
    fi
    case "${DEBIAN_VERSION_ID}" in
        12|13) ;;
        *) echo "Warning: this script is intended for Debian 12 or Debian 13. Detected VERSION_ID=${DEBIAN_VERSION_ID}." ;;
    esac
fi

sudo -v

sudo rm -f "${OSMC_LIST}"
sudo rm -f "${OSMC_APT_WEAK_CONF}"
sudo rm -f /etc/apt/sources.list.d/osmc*.list
sudo rm -f /var/lib/apt/lists/*apt.osmc.tv* /var/lib/apt/lists/*ftp.fau.de_osmc* 2>/dev/null || true

if [ "${DEBIAN_VERSION_ID}" = "13" ]; then
    OSMC_REPO_LINE="deb [trusted=yes allow-insecure=yes allow-weak=yes] https://apt.osmc.tv bullseye-devel main"
    sudo tee "${OSMC_APT_WEAK_CONF}" > /dev/null <<'EOF'
Acquire::AllowInsecureRepositories "true";
Acquire::AllowDowngradeToInsecureRepositories "true";
Acquire::AllowWeakRepositories "true";
APT::Get::AllowUnauthenticated "true";
EOF
fi

echo "${OSMC_REPO_LINE}" | sudo tee "${OSMC_LIST}" > /dev/null

sudo apt -o Acquire::AllowInsecureRepositories=true -o Acquire::AllowWeakRepositories=true update
sudo apt install -y ca-certificates gnupg dirmngr wget git build-essential fakeroot devscripts equivs rsync texinfo libncurses-dev whois bc cpio python3 python-is-python3 bison flex libssl-dev unzip xz-utils subversion qemu-user qemu-user-static binfmt-support

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
else
    sudo apt install -y qemu
fi

if [ "${DEBIAN_VERSION_ID}" != "13" ]; then
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
fi

if ! apt-cache policy armv7-toolchain-osmc | grep -q 'Candidate:'; then
    echo "armv7-toolchain-osmc was not found in APT metadata. Check ${OSMC_LIST}."
    exit 1
fi

if apt-cache policy armv7-toolchain-osmc | grep -q 'Candidate: (none)'; then
    echo "armv7-toolchain-osmc has no install candidate. Check ${OSMC_LIST}."
    exit 1
fi

echo "Setup complete."
echo "From your OSMC checkout, build with:"
echo "  cd package/mediacenter-osmc"
echo "  make vero5"
