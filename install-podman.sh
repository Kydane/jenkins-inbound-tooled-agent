#!/usr/bin/env bash
set -euo pipefail

echo "Installing podman and buildah"
apt-get update
apt-get install -y \
  podman \
  buildah