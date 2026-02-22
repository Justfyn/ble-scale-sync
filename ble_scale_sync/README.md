# BLE Scale Sync (Garmin) - Home Assistant Add-on

Minimal Home Assistant add-on to read Xiaomi Mi Scale 2 measurements over BLE and upload to Garmin Connect.

## Install

1. Add this repository as a custom add-on repository in Home Assistant.
2. Install the add-on and start it.
3. Edit the config at /config/ble-scale-sync/config.yaml.
4. Set add-on options for GARMIN_EMAIL and GARMIN_PASSWORD.
5. Optional: set the BLE backend via the add-on option `noble_driver` (use `abandonware` or `stoprocent`).

## Notes

- This add-on requires host networking, host D-Bus access, and privileged mode for BLE.
- The add-on creates a default config file on first run if none exists.
- Garmin tokens are stored at /data/garmin_tokens and persist across restarts.

## Example config

See config.yaml.example in this add-on folder.

## Repository metadata

Update repository.yaml with your actual repository URL and maintainer info.
