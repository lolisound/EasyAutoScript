#!/bin/bash
if [ "$UID" != "0" ]
then
	echo "请使用 root 账户执行本程序."
	exit 0
fi

mkdir /usr/share/fonts/opentype

# adobe source code pro
cp -r SourceCodeVariable /usr/share/fonts/opentype

# install
cd /usr/share/fonts
mkfontscale
mkfontdir
fc-cache -fv
cd -
