#!/bin/bash

set -euo pipefail

if [ -e "$HOME/.npmrc" ]; then
	rm "$HOME/.npmrc"
fi

ln -s "$(pwd)/npm/npmrc" "$HOME/.npmrc"

