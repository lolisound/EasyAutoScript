#!/bin/bash
# 修改主机名

if [ "$UID" != "0" ]; then
	echo "请使用 root 账户执行本程序."
	exit 0
fi

echo "请输入主机名："
read hostname

### 更改主机名
if test -n "$hostname"; then
    echo "$hostname" > /etc/hostname
    hostname -F /etc/hostname
fi

# Change Timezone
# dpkg-reconfigure tzdata

# Change locales
# dpkg-reconfigure locales