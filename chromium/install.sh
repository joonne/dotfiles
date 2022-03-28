#!/bin/bash

set -euo pipefail

config="$HOME/.config"

ln -sf "$(pwd)/chromium/chromium-flags.conf" "$config/chromium-flags.conf"

