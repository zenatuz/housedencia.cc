#!/bin/bash

set -euo pipefail

# --------------------------------------
# Settings
# --------------------------------------
REMOTE_LIST_URL="https://housedencia-cc.vercel.app/custom.list"
LOCAL_LIST_PATH="/home/zenatuz/homelab/pihole-unbound/custom.list"
COMPOSE_PROJECT_DIR="/home/zenatuz/homelab/pihole-unbound"
SERVICE_NAME="pihole"

# --------------------------------------
# Download updated custom.list
# --------------------------------------
echo "[INFO] Downloading updated custom.list from ${REMOTE_LIST_URL}..."

if curl -fsSL "$REMOTE_LIST_URL" -o "$LOCAL_LIST_PATH"; then
  echo "[OK] custom.list successfully downloaded to ${LOCAL_LIST_PATH}."
else
  echo "[ERROR] Failed to download custom.list." >&2
  exit 1
fi

# --------------------------------------
# Restart Pi-hole container to apply changes
# --------------------------------------
echo "[INFO] Restarting Pi-hole container..."

if cd "$COMPOSE_PROJECT_DIR"; then
  docker compose restart "$SERVICE_NAME"
  echo "[OK] Pi-hole container restarted successfully."
else
  echo "[ERROR] Could not change to directory ${COMPOSE_PROJECT_DIR}." >&2
  exit 1
fi

echo "[DONE] Update completed successfully."
