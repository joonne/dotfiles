#!/bin/bash

set -euo pipefail

BAT0=$(cat /sys/class/power_supply/BAT0/capacity)
BAT1=$(cat /sys/class/power_supply/BAT1/capacity)

echo "BAT $BAT0 $BAT1"

exit 0
