FROM node:20-slim

ARG BLE_SCALE_SYNC_VERSION=1.3.1
ENV NODE_ENV=production

RUN apt-get update && apt-get install -y --no-install-recommends \
      bluetooth \
      bluez \
      libbluetooth-dev \
      libusb-1.0-0-dev \
      libdbus-1-dev \
      dbus \
      build-essential \
      python3 \
      python3-pip \
      python3-venv \
      git \
      ca-certificates \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
RUN git clone --depth 1 --branch v${BLE_SCALE_SYNC_VERSION} \
    https://github.com/KristianP26/ble-scale-sync.git /app

RUN chmod +x /app/docker-entrypoint.sh

RUN pip3 install --break-system-packages --no-cache-dir -r requirements.txt
RUN npm ci --omit=dev && npm cache clean --force

COPY config.yaml.example /app/config.yaml.example
COPY run.sh /run.sh
RUN chmod +x /run.sh

ENTRYPOINT ["/run.sh"]
