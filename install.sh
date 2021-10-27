#!/bin/bash

git submodule init
git submodule update

# Install AUR helper
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay

# Install packages
yay -S reflector
sudo reflector --save /etc/pacman.d/mirrorlist --sort rate -c Finland -n 15 -p https

yay -Syu
yay -S $(< packages.txt)

for f in */install.sh; do
	$f
done
