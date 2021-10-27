#!/bin/bash

set -euo pipefail

config="$HOME/.config/zsh"
cache="$HOME/.cache/zsh"

if [ -e "$HOME/.zshrc" ]; then
	rm "$HOME/.zshrc"
fi

ln -s "$(pwd)/zsh/zshrc" "$HOME/.zshrc"

