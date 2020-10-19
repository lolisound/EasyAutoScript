#!/bin/bash

if [ "$UID" != "0" ]; then
	echo "Error: This script must be run as root !"
	exit 0
fi

cd /usr/share/fonts
mkfontscale
mkfontdir
fc-cache -fv
cd -
