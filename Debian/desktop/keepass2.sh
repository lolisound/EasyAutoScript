#!/bin/bash

sudo apt-get install -y keepass2 xdotool
keepass2='/usr/lib/keepass2'
sudo mkdir $keepass2/Languages
sudo cp Chinese_Simplified.lngx $keepass2/Languages
echo -e "<KeePass2 Auto-Type>"
echo -e "mono $keepass2/KeePass.exe --auto-type\n"
