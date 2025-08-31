#!/bin/bash
set -euo pipefail

echo "[INFO] Starting Node Exporter..."

docker run -d \
  --name=node-exporter \
  -p 9100:9100 \
  --restart unless-stopped \
  prom/node-exporter