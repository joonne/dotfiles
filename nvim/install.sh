#!/bin/bash

set -euo pipefail

config="$HOME/.config/nvim"

if [ -e "$config" ]; then
	rm -r "$config"
fi

mkdir -p "$config"

ln -s "$(pwd)/nvim/init.lua" "$config/init.lua" 
ln -s "$(pwd)/nvim/lua" "$config/lua"
ln -s "$(pwd)/nvim/after" "$config/after"

