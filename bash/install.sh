#!/bin/bash

set -euo pipefail

if [ -e "$HOME/.bashrc" ]; then
	rm "$HOME/.bashrc"
fi

ln -s "$(pwd)/bash/bashrc" "$HOME/.bashrc"

