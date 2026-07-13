#!/usr/bin/env bash
set -euo pipefail

INSTALL_DIR="${HELM_INSTALL_DIR:-/usr/local/bin/}"

mkdir -p "${INSTALL_DIR}"
export PATH="${INSTALL_DIR}:${PATH}"

curl -fsSL https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 |
  HELM_INSTALL_DIR="${INSTALL_DIR}" \
  USE_SUDO=false \
  bash

helm version --short
