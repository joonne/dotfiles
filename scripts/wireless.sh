#!/bin/bash
# > wpa_passphrase MYSSID passphrase >> wpa_supplicant.conf

INTERFACE=wlp3s0

ip link set $INTERFACE up
wpa_supplicant -B -i $INTERFACE -c /etc/wpa_supplicant/wpa_supplicant.conf
dhcpcd $INTERFACE
