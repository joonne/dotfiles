#!/bin/bash

set -euo pipefail

mkdir -p "$HOME/.config/mcphub"

ln -sf "$(pwd)/mcphub/servers.json" "$HOME/.config/mcphub/servers.json"


