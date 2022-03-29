#!/bin/bash

set -euo pipefail

config="$HOME/.config/input-remapper"
corneConfig="$config/presets/foostan Corne"

if [ -e "$config" ]; then
	rm -r "$config"
fi

mkdir -p "$config"
mkdir -p "$corneConfig"

ln -s "$(pwd)/input-remapper/config.json" "$config/config.json"
ln -s "$(pwd)/input-remapper/corne.json" "$corneConfig/corne.json"
