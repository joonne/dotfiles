#!/bin/bash

set -euo pipefail

ln -sf "$(pwd)/electron/electron-flags.conf" "$HOME/.config/electron-flags.conf"
ln -sf "$(pwd)/electron/electron-flags.conf" "$HOME/.config/electron17-flags.conf"

