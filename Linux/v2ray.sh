#!/bin/bash

if [ "$UID" != "0" ]; then
	echo "Error: This script must be run as root !"
	exit 0
fi

# old script
# bash <(curl -L -s https://install.direct/go.sh)

# download
curl -O https://raw.githubusercontent.com/v2fly/fhs-install-v2ray/master/install-release.sh

# install or update V2Ray
bash ./install-release.sh

# download/install/update geoip.dat & geosite.dat
# curl -O https://raw.githubusercontent.com/v2fly/fhs-install-v2ray/master/install-dat-release.sh
# bash install-dat-release.sh

# remove V2Ray
# bash install-release.sh --remove
