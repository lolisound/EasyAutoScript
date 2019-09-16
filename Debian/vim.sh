#!/bin/bash

## vim
sudo apt-get install -y git vim ctags

# my config
git clone --depth=1 git@github.com:lolisound/vim-config.git
cd vim-config
bash ./install.sh
cd -
rm -rf vim-config
