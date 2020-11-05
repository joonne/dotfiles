#!/bin/bash

set -euxo pipefail

sudo paccache -r && sudo pacman -Rns $(pacman -Qtdq)
