#!/bin/bash
set -euo pipefail

echo "[INFO] Running system updates..."

sudo apt-get update -y
sudo apt-get upgrade -y

if command -v unattended-upgrade &>/dev/null; then
  echo "[INFO] Running unattended-upgrade..."
  sudo unattended-upgrade -d
fi

sudo apt-get autoremove -y
sudo apt-get clean

echo "[SUCCESS] Patch complete."