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
pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple pip -U
pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U

# git
apt-get install -y git wget curl

# vim
apt-get install -y git vim exuberant-ctags

# ssh
apt-get install -y ssh openssl

# ssh automatic disconnection
sed -i "s/#TCPKeepAlive yes/TCPKeepAlive yes\nClientAliveInterval 60\nClientAliveCountMax 120/g" /etc/ssh/sshd_config
systemctl restart sshd.service

# other
apt install -y screenfetch htop

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
