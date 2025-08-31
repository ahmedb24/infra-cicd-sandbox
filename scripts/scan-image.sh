#!/bin/bash
set -euo pipefail

IMAGE=${1:-hello-nginx:latest}

echo "[INFO] Running Trivy scan for image: $IMAGE"

if ! command -v trivy &>/dev/null; then
  echo "[INFO] Installing Trivy..."
  sudo apt-get update -y && sudo apt-get install -y wget
  wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | sudo apt-key add -
  echo deb https://aquasecurity.github.io/trivy-repo/deb stable main | sudo tee /etc/apt/sources.list.d/trivy.list
  sudo apt-get update -y && sudo apt-get install -y trivy
fi

trivy image --exit-code 1 --severity CRITICAL,HIGH --format table "$IMAGE"

echo "[SUCCESS] Trivy scan completed."


