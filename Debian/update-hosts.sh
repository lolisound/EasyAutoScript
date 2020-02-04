#!/bin/bash
if [ "$UID" != "0" ]; then
	echo "请使用 root 账户执行本程序."
	exit 0
fi

echo 'wget -O /etc/hosts https://raw.githubusercontent.com/googlehosts/hosts/master/hosts-files/hosts
echo "127.0.0.1    `cat /etc/hostname`" >> /etc/hosts' > /usr/local/bin/update-hosts
chmod +x /usr/local/bin/update-hosts
/usr/local/bin/update-hosts
