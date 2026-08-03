#!/usr/bin/env bash
set -euo pipefail

VERSION="${KUBECTL_VERSION:-$(curl -fsSL https://dl.k8s.io/release/stable.txt)}"

case "$(uname -m)" in
  x86_64) ARCH="amd64" ;;
  aarch64|arm64) ARCH="arm64" ;;
  *) echo "Unsupported architecture: $(uname -m)" >&2; exit 1 ;;
esac

BASE_URL="https://dl.k8s.io/release/${VERSION}/bin/linux/${ARCH}"

curl -fsSLO "${BASE_URL}/kubectl"
curl -fsSLO "${BASE_URL}/kubectl.sha256"

echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

rm -f kubectl kubectl.sha256
kubectl version --client
