#!/bin/bash

if [ "$UID" != "0" ]; then
	echo "Error: This script must be run as root !"
	exit 0
fi

git clone --depth=1 https://github.com/googlehosts/hosts
cp ./hosts/hosts-files/hosts /etc/hosts
echo "127.0.0.1    `cat /etc/hostname`" >> /etc/hosts
rm -rf ./hosts