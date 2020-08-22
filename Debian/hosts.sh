#!/bin/bash
if [ "$UID" != "0" ]; then
	echo "请使用 root 账户执行本程序."
	exit 0
fi

git clone --depth=1 https://github.com/googlehosts/hosts
cp ./hosts/hosts-files/hosts /etc/hosts
echo "127.0.0.1    `cat /etc/hostname`" >> /etc/hosts
rm -rf ./hosts

# echo 'wget -O /etc/hosts https://raw.githubusercontent.com/googlehosts/hosts/master/hosts-files/hosts
# echo "127.0.0.1    `cat /etc/hostname`" >> /etc/hosts' > /usr/local/bin/update-hosts
# chmod +x /usr/local/bin/update-hosts
# /usr/local/bin/update-hosts
