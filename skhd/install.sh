#!/bin/bash

set -euo pipefail

config="$HOME/.config/skhd"

if [ -e "$config" ]; then
	rm -r "$config"
fi

mkdir -p "$config"

ln -s "$(pwd)/skhd/skhdrc" "$config/skhdrc"

