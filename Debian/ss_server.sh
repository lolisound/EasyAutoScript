#!/bin/bash
if [ "$UID" != "0" ]; then
	echo "请使用 root 账户执行本程序."
	exit 0
fi
echo 'Server IP address'
read server_ip
echo 'Port number'
read server_port
echo 'Password'
read password
method='chacha20'

apt-get update && apt-get install -y python3 python3-pip libsodium-dev
ldconfig

pip3 install shadowsocks
mkdir /etc/shadowsocks/
echo "{
    \"server\":\"$server_ip\",
    \"server_port\":\"$server_port\",
    \"local_address\": \"127.0.0.1\",
    \"local_port\":\"1080\",
    \"password\":\"$password\",
    \"timeout\":\"300\",
    \"method\":\"$method\",
    \"fast_open\": \"false\",
    \"workers\": \"1\",
    \"prefer_ipv6\": \"false\"
}" > /etc/shadowsocks/config.json

echo "[Unit]
Description=ShadowSocks
After=network.target
Wants=network-online.target

[Service]
Type=forking
ExecStart=/usr/local/bin/ssserver -c /etc/shadowsocks/config.json -d start
ExecStop=/usr/local/bin/ssserver -c /etc/shadowsocks/config.json -d stop
Restart=on-failure

[Install]
WantedBy=multi-user.target" > /etc/systemd/system/shadowsocks.service

systemctl start shadowsocks.service
systemctl enable shadowsocks.service
systemctl status shadowsocks.service
