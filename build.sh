#!/usr/bin/env bash
set -euo pipefail

# Re-buntu build entry point.
# Builds an Ubuntu-based RebuiltTux live ISO using live-build.

CODENAME="${CODENAME:-noble}"
ARCH="${ARCH:-amd64}"
BUILD_DIR="${BUILD_DIR:-build}"

# live-build needs root privileges for debootstrap/chroot/mount operations.
if [[ "${EUID}" -ne 0 ]]; then
  echo "Re-buntu's live-build process requires root privileges."
  echo "Run with: sudo ./build.sh"
  exit 1
fi

command -v lb >/dev/null 2>&1 || {
  echo "live-build is required. Install it with: apt install live-build"
  exit 1
}

rm -rf "${BUILD_DIR}" dist
mkdir -p "${BUILD_DIR}"
cd "${BUILD_DIR}"

lb config \
  --distribution "${CODENAME}" \
  --architectures "${ARCH}" \
  --archive-areas "main restricted universe multiverse" \
  --binary-images iso-hybrid \
  --debian-installer live \
  --apt-recommends false \
  --bootappend-live "boot=live components quiet splash"

# Copy Re-buntu customization into the generated live-build tree.
cp -a ../config/. config/

lb build

mkdir -p ../dist
mv live-image-*.hybrid.iso "../dist/re-buntu-${CODENAME}-${ARCH}.iso"

echo "Built dist/re-buntu-${CODENAME}-${ARCH}.iso"
