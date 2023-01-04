#!/bin/bash

set -euo pipefail

config="$HOME"

# git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

if [ -e "$config/.tmux.conf" ]; then
  rm $config/.tmux.conf
fi


ln -s "$(pwd)/tmux/tmux.conf" "$config/.tmux.conf"
