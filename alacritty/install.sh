#!/bin/bash

set -euo pipefail

config="$HOME/.config/alacritty"

if [ -e "$config" ]; then
	rm -r "$config"
fi

mkdir -p "$config"

ln -s "$(pwd)/alacritty/alacritty.yml" "$config/alacritty.yml"

