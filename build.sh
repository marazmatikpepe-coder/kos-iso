#!/usr/bin/env bash
# Local build on Debian/Ubuntu (root): ./build.sh https://your.site PUBKEY_BASE64
set -euo pipefail
cd "$(dirname "$0")"
chmod +x config/hooks/live/*.chroot config/includes.chroot/usr/local/bin/kos-updater
apt-get update
apt-get install -y live-build
mkdir -p config/includes.chroot/etc/k-os
echo "{\"server\":\"${1:?server}\",\"pubkey\":\"${2:?pubkey}\",\"version\":\"1.0.0\"}" > config/includes.chroot/etc/k-os/update.json
lb config --distribution bookworm --architectures amd64 --binary-images iso-hybrid \
  --bootloaders "grub-efi syslinux" --debian-installer none --apt-recommends false \
  --archive-areas "main contrib non-free-firmware" --iso-volume K-OS --image-name k-os
lb build
ls -lh *.iso
