#!/bin/bash

set -euo pipefail

BAT=$(cat /sys/class/power_supply/BAT0/capacity)

echo "BAT $BAT"

exit 0
