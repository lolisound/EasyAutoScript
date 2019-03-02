#!/bin/bash
if [ "$UID" != "0" ]
then
	echo "请使用 root 账户执行本程序."
	exit 0
fi

pip3 install --upgrade pip
pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U
