#!/bin/bash

if [ "$UID" != "0" ]; then
	echo "请使用 root 账户执行本程序."
	exit 0
fi

# install sudo
apt install -y sudo

echo "请输入用户名："
read username
if test -n "$username" ; then
    echo "请输入密码："
    read -s passwd
    echo "确认您输入的密码："
    read -s repasswd
    while [ "$passwd" != "$repasswd" ]; do
		echo -e "\033[1;31m确认密码不相同。\n再次输入密码和确认密码：\033[0m"
		read -s passwd
		echo "请确认您输入的密码："
		read -s repasswd
    done
fi

### 创建普通用户，并设置密码
if test -n "$username"; then
    useradd -m $username
	# useradd -m -s /bin/zsh $username
	echo -e "$passwd\n$passwd" | passwd $username
fi

### 给用户添加sudo权限
if test -n "$username"; then
    echo "$username  ALL=(ALL:ALL)  NOPASSWD:ALL" >> /etc/sudoers
fi
