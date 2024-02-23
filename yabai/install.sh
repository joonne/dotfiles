#!/bin/bash

set -euo pipefail

config="$HOME/.config/yabai"

if [ -e "$config" ]; then
	rm -r "$config"
fi

mkdir -p "$config"

ln -s "$(pwd)/yabai/yabairc" "$config/yabairc" 

