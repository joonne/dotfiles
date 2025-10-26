#!/bin/bash

set -euo pipefail

if [ -e "$HOME/.abcde.conf" ]; then
	rm "$HOME/.abcde.conf"
fi

ln -s "$(pwd)/abcde/abcde.conf" "$HOME/.abcde.conf"

