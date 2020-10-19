#!/bin/bash
# devel
sudo apt-get install -y meson ninja-build gnome-tweak-tool
# download
git clone --depth=1 https://github.com/snwh/suru-icon-theme
# build
cd ./suru-icon-theme
meson "build" --prefix=/usr
# install
sudo ninja -C "build" install
# set the icon theme
gsettings set org.gnome.desktop.interface icon-theme "Suru"
# or the cursor theme
gsettings set org.gnome.desktop.interface cursor-theme "Suru"
# del
rm -rf ./suru-icon-theme
