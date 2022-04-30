#!/bin/bash

set -euo pipefail

config="$HOME/.config/fish"

if [ -d "$config" ]; then
	rm -rf "$config"
fi

mkdir -p $config

ln -s "$(pwd)/fish/config.fish" "$config/config.fish"

