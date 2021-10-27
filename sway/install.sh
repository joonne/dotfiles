#!/bin/bash

set -euo pipefail

config="$HOME/.config/sway"

if [ -e "$config" ]; then
	rm -r "$config"
fi

mkdir -p "$config"

ln -s "$(pwd)/sway/i3blocks.conf" "$config/i3blocks.conf"
ln -s "$(pwd)/sway/config" "$config/config"
