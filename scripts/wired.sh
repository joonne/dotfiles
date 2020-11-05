#!/bin/bash
# > wpa_passphrase MYSSID passphrase >> wpa_supplicant.conf

INTERFACE=enp0s25

ip link set $INTERFACE up
dhcpcd $INTERFACE
