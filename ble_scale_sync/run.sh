#!/bin/sh
set -e

CONFIG_DIR="/config/ble-scale-sync"
CONFIG_PATH="${CONFIG_DIR}/config.yaml"
EXAMPLE_PATH="/app/config.yaml.example"

if [ ! -f "${CONFIG_PATH}" ]; then
  mkdir -p "${CONFIG_DIR}"
  if [ -f "${EXAMPLE_PATH}" ]; then
    cp "${EXAMPLE_PATH}" "${CONFIG_PATH}"
    echo "Created default config at ${CONFIG_PATH}"
  fi
fi

cp "${CONFIG_PATH}" /app/config.yaml

mkdir -p /data/garmin_tokens

if [ -f /data/options.json ]; then
  SCALE_MAC=$(python3 -c "import json;print(json.load(open('/data/options.json')).get('scale_mac',''))")
  GARMIN_EMAIL=$(python3 -c "import json;print(json.load(open('/data/options.json')).get('garmin_email',''))")
  GARMIN_PASSWORD=$(python3 -c "import json;print(json.load(open('/data/options.json')).get('garmin_password',''))")
  CONTINUOUS_MODE=$(python3 -c "import json;print(json.load(open('/data/options.json')).get('continuous_mode',''))")
  SCAN_COOLDOWN=$(python3 -c "import json;print(json.load(open('/data/options.json')).get('scan_cooldown',''))")
  DEBUG=$(python3 -c "import json;print(json.load(open('/data/options.json')).get('debug',''))")

  if [ -n "${SCALE_MAC}" ]; then
    export SCALE_MAC
  fi
  if [ -n "${GARMIN_EMAIL}" ]; then
    export GARMIN_EMAIL
  fi
  if [ -n "${GARMIN_PASSWORD}" ]; then
    export GARMIN_PASSWORD
  fi
  if [ -n "${CONTINUOUS_MODE}" ]; then
    export CONTINUOUS_MODE
  fi
  if [ -n "${SCAN_COOLDOWN}" ]; then
    export SCAN_COOLDOWN
  fi
  if [ -n "${DEBUG}" ]; then
    export DEBUG
  fi
fi

exec /app/docker-entrypoint.sh start
