#!/bin/bash
if [ "$UID" != "0" ]
then
	echo "请使用 root 账户执行本程序."
	exit 0
fi
apt update && apt upgrade -y && apt autoremove -y && apt autoclean

## vim
apt install -y vim ctags

## git
apt install -y git wget curl

## openssh
apt install -y openssl ssh

## c & c++
apt install -y gcc g++ make

## python
apt install -y python3 python3-pip
#apt install -y libapache2-mod-wsgi-py3
#update-alternatives --install /usr/bin/python python /usr/bin/python2 1
#update-alternatives --install /usr/bin/python python /usr/bin/python3 2
#update-alternatives --install /usr/bin/pip pip /usr/bin/pip3 1

## nodejs
# https://github.com/nodesource/distributions/blob/master/README.md#deb
apt install -y build-essential
# Using Ubuntu
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y nodejs
# Using Debian, as root
# curl -sL https://deb.nodesource.com/setup_12.x | bash -
# apt-get install -y nodejs

npm config set registry https://registry.npm.taobao.org
