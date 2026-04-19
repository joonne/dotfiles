#!/bin/bash

set -euo pipefail

config="$HOME/.config/qmk"

if [ -d "$config" ]; then
    rm -rf "$config"
fi

mkdir -p $config

ln -s "$(pwd)/qmk/keyboards" "$config/keyboards"
ln -s "$(pwd)/qmk/qmk.ini" "$config/qmk.ini"
ln -s "$(pwd)/qmk/qmk.json" "$config/qmk.json"

# qmk setup
# qmk config user.overlay_dir="$config"
# qmk compile -kb crkbd -km joonne
