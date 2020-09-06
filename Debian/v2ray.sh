#!/bin/bash
# V2Ray

if [ "$UID" != "0" ]; then
	echo "请使用 root 账户执行本程序."
	exit 0
fi

# bash <(curl -L -s https://install.direct/go.sh)

# 安装 cURL
apt install curl

# 下载
curl -O https://raw.githubusercontent.com/v2fly/fhs-install-v2ray/master/install-release.sh
curl -O https://raw.githubusercontent.com/v2fly/fhs-install-v2ray/master/install-dat-release.sh

# 安装和更新 V2Ray
bash install-dat-release.sh
# 安装最新发行的 geoip.dat 和 geosite.dat
bash install-dat-release.sh
# 移除 V2Ray
bash install-release.sh --remove