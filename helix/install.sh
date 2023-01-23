#!/bin/bash

set -euo pipefail

config="$HOME/.config/helix"

if [ -e "$config" ]; then
	rm -r "$config"
fi

mkdir -p "$config"

ln -s "$(pwd)/helix/config.toml" "$config/config.toml"
ln -s "$(pwd)/helix/languages.toml" "$config/languages.toml"
