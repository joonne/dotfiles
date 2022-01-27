#!/bin/bash

set -euo pipefail

config="$HOME/.config/mako"

if [ -e "$config" ]; then
	rm -r "$config"
fi

mkdir -p "$config"

ln -s "$(pwd)/mako/config" "$config/config"
