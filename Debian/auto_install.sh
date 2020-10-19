#!/bin/bash

if [ "$UID" != "0" ]; then
	echo "Error: This script must be run as root !"
	exit 0
fi

# c & c++
apt-get install -y gcc g++ make

# python3
apt-get install -y python3 python3-pip
update-alternatives --install /usr/bin/python python /usr/bin/python2 1
update-alternatives --install /usr/bin/python python /usr/bin/python3 2

# python3-pip
pip3 install --upgrade pip
pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U

# git
apt-get install -y git wget curl

# vim
apt-get install -y git vim ctags

# ssh
apt-get install -y ssh openssl

# ssh automatic disconnection
sed -i "s/#TCPKeepAlive yes/TCPKeepAlive yes\nClientAliveInterval 60\nClientAliveCountMax 120/g" /etc/ssh/sshd_config
systemctl restart sshd.service

# zsh
apt-get install -y git curl zsh zsh-syntax-highlighting zsh-autosuggestions

# setting
sh -c 'echo "source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> /etc/zsh/zshrc'
sh -c 'echo "setopt no_nomatch" >> /etc/zsh/zshrc'
sh -c 'echo "zstyle \":completion:*\" rehash true" >> /etc/zsh/zshrc'
sh -c 'echo "plugins=(zsh-autosuggestions)" >> /etc/zsh/zshrc'

# oh my zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="ys"/g' ~/.zshrc

# apache2
apt-get install -y apache2

# nginx
apt-get install -y nginx

# postgreSQL
apt-get install -y postgresql
pg_ctlcluster 11 main start

# php
apt-get install -y php php-pgsql libapache2-mod-php
apt-get install -y php-zip php-xml php-intl php-gd php-curl php-mbstring php-apcu php-intl

# PostgreSQL Settings
find / -name pg_hba.conf
sed -i '85,90s/peer/md5/g' /etc/postgresql/11/main/pg_hba.conf
sed -i '85,90s/ident/md5/g' /etc/postgresql/11/main/pg_hba.conf
systemctl restart postgresql.service
systemctl restart apache2.service
systemctl restart php7.3-fpm.service

# Desktop
apt install -y numlockx
apt install -y screenfetch
apt install -y libreoffice
apt install -y vlc
apt install -y gimp
apt install -y inkscape

# fonts
apt-get install -y fonts-noto fonts-inconsolata fonts-wqy-zenhei fonts-wqy-microhei fonts-fantasque-sans

# ibus-rime
apt-get install -y ibus-rime

#  rime to 9
mkdir -p ~/.config/ibus/rime
echo -e "patch:\n  \"menu/page_size\": 9" > ~/.config/ibus/rime/default.custom.yaml
ibus-daemon -drx

# keepass2
apt-get install -y keepass2 xdotool
keepass2='/usr/lib/keepass2'
mkdir $keepass2/Languages
cp Chinese_Simplified.lngx $keepass2/Languages
echo -e "<KeePass2 Auto-Type>"
echo -e "mono $keepass2/KeePass.exe --auto-type\n"

# nfs
apt-get install -y nfs-common

# mount
# mount.nfs 192.168.1.*:/* /mnt
# /etc/fstab
# 192.168.1.*:/*  /mnt nfs  defaults  0  0

# Google Chrome
# https://www.google.cn/chrome/index.html

# VirtualBox
# https://www.virtualbox.org/wiki/Downloads

# WPS Office
# https://www.wps.cn/product/wpslinux

# Steam
# https://store.steampowered.com/about/

# Visual Studio Code
# https://code.visualstudio.com/

# Atom
# https://atom.io/