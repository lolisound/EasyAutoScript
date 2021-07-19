#!/bin/bash

## nodejs
# https://github.com/nodesource/distributions/blob/master/README.md#deb
sudo apt-get install -y build-essential
source /etc/os-release

if [ "$ID" == "ubuntu" ]; then
	# Using Ubuntu
	curl -sL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
	sudo apt-get install -y nodejs
	https://mirrors.tuna.tsinghua.edu.cn/nodesource/deb_14.x/
	#sed -i "s/https:\/\/deb.nodesource.com\/node_14.x\/https:\/\/mirrors.tuna.tsinghua.edu.cn\/nodesource\/deb_14.x/g" /etc/apt/sources.list.d/nodesource.list

elif [ "$ID" == "debian" ]; then
	# Using Debian, as root
	curl -sL https://deb.nodesource.com/setup_lts.x | bash -
	apt-get install -y nodejs
	#sed -i "s/https:\/\/deb.nodesource.com\/node_14.x\/https:\/\/mirrors.tuna.tsinghua.edu.cn\/nodesource\/deb_14.x/g" /etc/apt/sources.list.d/nodesource.list
else
	echo "Error, $ID not debian or ubuntu."
fi

npm config set registry https://registry.npm.taobao.org
