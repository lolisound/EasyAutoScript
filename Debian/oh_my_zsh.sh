#!/bin/bash

# install
sudo apt-get install -y git curl zsh zsh-syntax-highlighting

# setting
sudo sh -c 'echo "source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> /etc/zsh/zshrc'
sudo sh -c 'echo "setopt no_nomatch" >> /etc/zsh/zshrc'
sudo sh -c 'echo "zstyle \":completion:*\" rehash true" >> /etc/zsh/zshrc'

# oh my zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
echo "plugins=(zsh-autosuggestions)" >> ~/.zshrc
