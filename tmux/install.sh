#!/bin/bash

set -euo pipefail

config="$HOME"

# git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

rm $config/.tmux.conf
ln -s "$(pwd)/tmux/tmux.conf" "$config/.tmux.conf"
