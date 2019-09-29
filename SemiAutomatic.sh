#!/bin/bash
# Debina 10
# Semi-automatic setting Debian server.

# use root
if [ "$UID" != "0" ]; then
	echo "Use root to execute this program."
	exit 0
fi

## Upgrade
apt-get update && apt-get upgrade -y && apt-get autoremove -y && apt-get autoclean

### Change hostname
echo "hostname :"
read hostname
if test -n "$hostname"; then
    echo "$hostname" > /etc/hostname
    hostname -F /etc/hostname
fi

# Github parameters 
echo "Enter your github username:"
read git_username
echo "Enter your email:"
read git_email

# Change Timezone
dpkg-reconfigure tzdata

# Change locales
dpkg-reconfigure locales

## BBR
echo "net.core.default_qdisc = fq" >> /etc/sysctl.conf
echo "net.ipv4.tcp_congestion_control = bbr" >> /etc/sysctl.conf
sysctl -p

## Git
sudo apt-get install -y git wget curl

# Git Setting
git config --global user.name \"$git_username\"
git config --global user.email \"$git_email\"
git config --global color.ui true
git config --global push.default simple
git config --global core.autocrlf input
git config --global core.safecrlf true

## Openssh
apt-get install -y openssl ssh

# SSH自动断线
sed -i "s/#TCPKeepAlive yes/TCPKeepAlive yes\nClientAliveInterval 60\nClientAliveCountMax 120/g" /etc/ssh/sshd_config
systemctl restart sshd.service

## Vim
apt-get install -y vim ctags
git clone --depth=1 https://github.com/lolisound/vim-config.git
cd vim-config
bash ./install.sh
cd -
rm -rf vim-config

## C & C++
apt-get install -y gcc g++ make

## Python3
apt install -y python3 python3-pip
update-alternatives --install /usr/bin/python python /usr/bin/python2 1
update-alternatives --install /usr/bin/python python /usr/bin/python3 2
pip3 install --upgrade pip
# pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U

# Nginx
apt-get install -y nginx

# PostgreSQL
apt-get install -y postgresql

# PostgreSQL Settings
sed -i '85,90s/peer/md5/g' `find / -name pg_hba.conf`
sed -i '85,90s/ident/md5/g' `find / -name pg_hba.conf`

# PHP
apt-get install -y php-fpm php-pgsql
apt-get install -y php php-zip php-xml php-intl php-gd php-curl php-mbstring php-apcu php-intl php-pear php-json php-cgi

## Oh My Zsh
apt-get install -y zsh zsh-syntax-highlighting
sh -c 'echo "source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> /etc/zsh/zshrc'
sh -c 'echo "setopt no_nomatch" >> /etc/zsh/zshrc'
sh -c 'echo "zstyle \":completion:*\" rehash true" >> /etc/zsh/zshrc'
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

## Prompt information
echo "------------------------------------------"
gcc --version
g++ --version
nginx -v
php -v 
psql -V
python -V
pip -V
sysctl net.ipv4.tcp_available_congestion_control
sysctl net.ipv4.tcp_congestion_control
lsmod | grep bbr
echo "Please switch SSH port manually\n
Installation of other services\n
Finally, restart manually"
