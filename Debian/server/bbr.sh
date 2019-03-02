#!/bin/bash
if [ "$UID" != "0" ]
then
	echo "请使用 root 账户执行本程序."
	exit 0
fi

echo "net.core.default_qdisc = fq" >> /etc/sysctl.conf
echo "net.ipv4.tcp_congestion_control = bbr" >> /etc/sysctl.conf
sysctl -p
echo "------------------------------------------"
sysctl net.ipv4.tcp_available_congestion_control
sysctl net.ipv4.tcp_congestion_control
lsmod | grep bbr
