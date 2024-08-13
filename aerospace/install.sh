#!/bin/bash

set -euo pipefail

config="$HOME/.config/aerospace"

if [ -e "$config" ]; then
	rm -r "$config"
fi

mkdir -p "$config"

ln -s "$(pwd)/aerospace/aerospace.toml" "$config/aerospace.toml" 

