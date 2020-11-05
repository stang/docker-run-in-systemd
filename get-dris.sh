#!/bin/bash
set -eu

SOURCE=https://raw.githubusercontent.com/stang/docker-run-in-systemd/main/dris
SCRIPT_NAME=$(basename "${SOURCE}")
DEST_DIR=/usr/local/bin/

if [ "$(id -u)" -ne 0 ]; then
  echo "Please run as root"
  exit 1
fi

TMP=$(mktemp)
trap 'rm -f $TMP' EXIT

curl -sSL "${SOURCE}" -o "${TMP}"
chmod +x "${TMP}"
mv "${TMP}" "${DEST_DIR}${SCRIPT_NAME}"
