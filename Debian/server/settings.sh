#!/bin/bash
# 修改主机名、时区、创建普通用户并设置密码

if [ "$UID" != "0" ]
then
	echo "请使用 root 账户执行本程序."
	exit 0
fi

echo "输入关于设置系统的一些信息，不输入信息并按回车键跳过。"

echo "请输入主机名："
read hostname

echo "请输入用户名："
read username
if test -n "$username"
then
    echo "请输入密码："
    read -s passwd
    echo "确认您输入的密码："
    read -s repasswd
    while [ "$passwd" != "$repasswd" ]
    do
        echo -e "\033[1;31m确认密码不相同。\n再次输入密码和确认密码：\033[0m"
        read -s passwd
        echo "请确认您输入的密码："
        read -s repasswd
    done
fi

### 更新系统
apt-get update && apt-get upgrade -y

### 更改主机名
if test -n "$hostname"
then
    echo "$hostname" > /etc/hostname
    hostname -F /etc/hostname
fi

### 更改主机时区为 '亚洲/上海'
# dpkg-reconfigure tzdata
# dpkg-reconfigure locales
timedatectl set-timezone 'Asia/Shanghai'
locale-gen zh_CN.UTF-8

### 创建普通用户，并设置密码
if test -n "$username"
then
    useradd $username
    echo $passwd | passwd --stdin  $username
fi

### 给用户添加sudo权限
if test -n "$username"
then
    sed -i "s/root	ALL=(ALL) 	ALL/root	ALL=(ALL) 	ALL\n$username	ALL=(ALL) 	ALL/g" /etc/sudoers
fi
