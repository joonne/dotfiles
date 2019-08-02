#!/bin/bash

set -euo pipefail

pactl list short sinks

read -p "Select index: " SINK

pactl list short sink-inputs | while read stream; do
  STREAM_ID=$(echo $stream|cut '-d ' -f1)
  pactl move-sink-input "$STREAM_ID" "$SINK"
done

pacmd set-default-sink "$SINK"
