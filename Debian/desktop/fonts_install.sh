#!/bin/bash
if [ "$UID" != "0" ]; then
	echo "请使用 root 账户执行本程序."
	exit 0
fi

# adobe source code pro
mkdir -p /usr/share/fonts/opentype/source-code-pro
git clone --depth=1 https://github.com/adobe-fonts/source-code-pro.git
cp -r ./source-code-pro/TTF/* /usr/share/fonts/opentype/source-code-pro
rm -rf ./source-code-pro


# install
cd /usr/share/fonts
mkfontscale
mkfontdir
fc-cache -fv
cd -
