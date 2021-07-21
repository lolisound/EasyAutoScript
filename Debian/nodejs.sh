#!/bin/bash

## nodejs
# https://github.com/nodesource/distributions/blob/master/README.md#deb
sudo apt-get install -y build-essential
source /etc/os-release

if [ "$ID" == "ubuntu" ]; then
	# Using Ubuntu
	curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
	sudo apt-get install -y nodejs
elif [ "$ID" == "debian" ]; then
	# Using Debian, as root
	curl -fsSL https://deb.nodesource.com/setup_lts.x | bash -
	apt-get install -y nodejs
else
	echo "Error, $ID not debian or ubuntu."
fi

npm config set registry https://registry.npm.taobao.org
