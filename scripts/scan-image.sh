#!/bin/bash
set -euo pipefail

IMAGE=${1:-hello-nginx:latest}

echo "[INFO] Running Trivy scan for image: $IMAGE"

if ! command -v trivy &>/dev/null; then
  echo "[INFO] Installing Trivy..."
  curl -fsSL https://raw.githubusercontent.com/aquasecurity/trivy/main/contrib/install.sh | sudo sh -s -- -b /usr/local/bin
fi

trivy image --exit-code 1 --severity CRITICAL,HIGH --format table "$IMAGE"

echo "[SUCCESS] Trivy scan completed."