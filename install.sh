#!/bin/bash

git submodule init
git submodule update

pacman -S reflector
sudo reflector --save /etc/pacman.d/mirrorlist --sort rate -c Finland -n 15 -p https

pacman -Syu --needed $(< packages.txt)

for f in */install.sh; do
	$f
done
