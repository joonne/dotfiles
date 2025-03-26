#!/bin/bash

set -euo pipefail

config="/etc/pulse"

if [ -d "$config" ]; then
	rm -rf "$config"
fi

mkdir -p $config

ln -s "$(pwd)/pulse-audio/default.pa" "$config/default.pa"

