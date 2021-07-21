#!/bin/bash

# OBS - Open Broadcaster Software
# https://obsproject.com/wiki/install-instructions#linux

sudo apt install ffmpeg -y

sudo add-apt-repository ppa:obsproject/obs-studio
sudo apt update
sudo apt install obs-studio -y
