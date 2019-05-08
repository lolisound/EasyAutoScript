# ShadowSocks

## Upgrade system

```bash
yum install update
```

## Install

```bash
# Install python & pip & shadowsocks
yum install python36 python36-pip
pip3 install shadowsocks
```

## Encryption method

```bash
# aes-256-cfb
yum -y install m2crypto
# chacha20
yum -y install gcc make
wget https://download.libsodium.org/libsodium/releases/LATEST.tar.gz
tar -xvf LATEST.tar.gz
cd libsodium-stable/
./configure && make all && make install
echo /usr/local/lib > /etc/ld.so.conf.d/usr_local_lib.conf
ldconfig
```

## Config

```bash
mkdir /etc/shadowsocks/
touch /etc/shadowsocks/config.json
```

```bash
# /etc/shadowsocks/config.json

{
    "server":"SERVER NAME",
    "server_port":"PORT",
    "local_address": "127.0.0.1",
    "local_port":"1080",
    "password":"PASSWORD",
    "timeout":"300",
    "method":"chacha20",
    "fast_open": "false",
    "workers": "1",
    "prefer_ipv6": "false"
}
```

## Service (Server)

```bash
# /etc/systemd/system/ssserver.service

[Unit]
Description=ShadowSocks
After=network.target
Wants=network-online.target

[Service]
Type=forking
ExecStart=/usr/local/bin/ssserver -c /etc/shadowsocks/config.json -d start
ExecStop=/usr/local/bin/ssserver -c /etc/shadowsocks/config.json -d stop
Restart=on-failure

[Install]
WantedBy=multi-user.target
```

```bash
# 启动服务
systemctl start ssserver.service
# 开机启动
systemctl enable ssserver.service
# 查看服务状态
systemctl status ssserver.service
```
