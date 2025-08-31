#!/bin/bash
set -euo pipefail

echo "[INFO] Running Checkov Terraform scan..."

if ! command -v checkov &>/dev/null; then
  pip install checkov
fi

checkov -d ./terraform --quiet --framework terraform || {
  echo "[ERROR] Checkov scan failed."
  exit 1
}

echo "[SUCCESS] Terraform IaC scan passed."