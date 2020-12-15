#!/bin/bash

if [ "$UID" != "0" ]; then
	echo "Error: This script must be run as root !"
	exit 0
fi

apt install -y numlockx
apt install -y libreoffice
apt install -y vlc
apt install -y gimp
apt install -y inkscape

# fonts
apt-get install -y fonts-noto fonts-inconsolata fonts-wqy-zenhei fonts-wqy-microhei fonts-fantasque-sans

# ibus-rime
apt-get install -y ibus-rime

#  rime to 9
mkdir -p ~/.config/ibus/rime
echo -e "patch:\n  \"menu/page_size\": 9" > ~/.config/ibus/rime/default.custom.yaml
ibus-daemon -drx

# keepass2
apt-get install -y keepass2 xdotool
keepass2='/usr/lib/keepass2'
mkdir $keepass2/Languages
cp Chinese_Simplified.lngx $keepass2/Languages
echo -e "<KeePass2 Auto-Type>"
echo -e "mono $keepass2/KeePass.exe --auto-type\n"

# nfs
apt-get install -y nfs-common

# mount
# mount.nfs 192.168.1.*:/* /mnt
# /etc/fstab
# 192.168.1.*:/*  /mnt nfs  defaults  0  0

# Google Chrome
# https://www.google.cn/chrome/index.html

# VirtualBox
# https://www.virtualbox.org/wiki/Downloads

# WPS Office
# https://www.wps.cn/product/wpslinux

# Steam
# https://store.steampowered.com/about/

# Visual Studio Code
# https://code.visualstudio.com/

# Atom
# https://atom.io/