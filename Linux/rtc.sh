#!/bin/bash

if [ "$UID" != "0" ]; then
	echo "Error: This script must be run as root !"
	exit 0
fi

timedatectl set-local-rtc 1 --adjust-system-clock
timedatectl set-ntp 0
hwclock --systohc