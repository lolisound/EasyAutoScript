#!/bin/bash

## nodejs
# https://github.com/nodesource/distributions/blob/master/README.md#deb
sudo apt-get install -y build-essential

source /etc/os-release
if [ "$ID" == "debian" ]; then
	# Using Ubuntu
	curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
	sudo apt-get install -y nodejs
	npm config set registry https://registry.npm.taobao.org
elif [ "$ID" == "ubuntu" ]; then
	# Using Debian, as root
	curl -sL https://deb.nodesource.com/setup_12.x | bash -
	apt-get install -y nodejs
	npm config set registry https://registry.npm.taobao.org
else
	echo "Error, $ID not debian or ubuntu."
fi
