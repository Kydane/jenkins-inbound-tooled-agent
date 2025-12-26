#!/usr/bin/env bash
set -euo pipefail

# Ensure running as root
if [[ "$(id -u)" -ne 0 ]]; then
  echo "This script must be run as root"
  exit 1
fi

echo "Installing prerequisites..."
apt-get update
apt-get install -y \
  ca-certificates \
  curl \
  gnupg \
  lsb-release

echo "Setting up Docker GPG key..."
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg \
  | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
chmod a+r /etc/apt/keyrings/docker.gpg

echo "Adding Docker APT repository..."
ARCH="$(dpkg --print-architecture)"
CODENAME="$(. /etc/os-release && echo "$VERSION_CODENAME")"

echo \
  "deb [arch=${ARCH} signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/debian ${CODENAME} stable" \
  > /etc/apt/sources.list.d/docker.list

echo "Installing docker-cli..."
apt-get update
apt-get install -y docker-ce-cli

echo "Docker CLI installed successfully."
docker --version