#!/bin/bash
# V2Ray

if [ "$UID" != "0" ]; then
	echo "请使用 root 账户执行本程序."
	exit 0
fi

bash <(curl -L -s https://install.direct/go.sh)
