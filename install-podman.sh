#!/usr/bin/env bash
set -euo pipefail

echo "Installing podman, buildah, and skopeo"
apt-get update
apt-get install -y \
  podman \
  buildah \
  skopeo
