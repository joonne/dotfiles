#!/bin/bash

set -euo pipefail

config="$HOME/.config/beets"

if [ -e "$config" ]; then
	rm -r "$config"
fi

mkdir -p "$config"

ln -s "$(pwd)/beets/config.yaml" "$config/config.yaml"

