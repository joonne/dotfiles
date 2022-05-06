#!/bin/bash

set -euo pipefail

config="$HOME/.config/xdg-desktop-portal-wlr"

if [ -e "$config" ]; then
	rm -r "$config"
fi

mkdir -p "$config"

ln -s "$(pwd)/xdg-desktop-portal-wlr/config" "$config/config"

