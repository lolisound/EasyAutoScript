#!/bin/bash
if [ "$UID" != "0" ]; then
	echo "请使用 root 账户执行本程序."
	exit 0
fi

# 安装
apt-get install -y ssh openssl

# SSH自动断线
sed -i "s/#TCPKeepAlive yes/TCPKeepAlive yes\nClientAliveInterval 60\nClientAliveCountMax 120/g" /etc/ssh/sshd_config


# 更改端口
# echo "请输入SSH端口号："
# read port
#if test -n "$port"; then
#	sed -i "s/Port 22/Port $port/g" /etc/ssh/sshd_config
#fi

# 禁止ROOT用户登录
#sed -i "s/PermitRootLogin yes/PermitRootLogin no/g" /etc/ssh/sshd_config

# 重启ssh服务
systemctl restart sshd.service
