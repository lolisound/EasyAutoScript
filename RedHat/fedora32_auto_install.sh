# Fedora32 Auto Install

## Test is Fedora
source /etc/os-release
if [ "$ID" != "fedora" ]; then
    echo "Not Fedora!"
    exit 1
fi

dnf makecache
dnf upgrade -y

# sudo
echo "$username  ALL=(ALL:ALL)  NOPASSWD:ALL" >> /etc/sudoers

## Git
dnf install -y git wget curl

## hosts
git clone --depth=1 https://github.com/googlehosts/hosts
cp ./hosts/hosts-files/hosts /etc/hosts
echo "127.0.0.1    `cat /etc/hostname`" >> /etc/hosts

## python3
dnf install -y python3 python3-pip
pip3 install --upgrade pip
pip3 config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple

## C&C++
dnf install -y gcc gcc-c++ make

## Node.js
curl -sL https://rpm.nodesource.com/setup_lts.x | bash -
dnf clean packages
dnf install -y nodejs
npm config set registry https://registry.npm.taobao.org
npm install -g browser-sync

# VLC
dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
dnf install -y vlc
dnf install -y python-vlc

## vscode
rpm --import https://packages.microsoft.com/keys/microsoft.asc
sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
dnf check-update
dnf install -y code

## Other
dnf install -y screenfetch
dnf install -y keepass
dnf install -y numlockx
dnf install -y libreoffice libreoffice-langpack-zh-Hans libreoffice-help-zh-Hans
dnf install -y gimp
dnf install -y inkscape
dnf install -y blender
dnf install -y libsodium-devel

## Fonts
dnf install -y google-noto-cjk-fonts
dnf install -y wqy-zenhei-fonts
dnf install -y wqy-microhei-fonts
dnf install -y ibus-rime
# mkdir -p ~/.config/ibus/rime
# echo -e "patch:\n  \"menu/page_size\": 9" > ~/.config/ibus/rime/default.custom.yaml
# ibus-daemon -drx

# zsh
dnf install -y zsh zsh-syntax-highlighting zsh-autosuggestions
sh -c 'echo "source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> /etc/zshrc'
sh -c 'echo "setopt no_nomatch" >> /etc/zshrc'
sh -c 'echo "zstyle \": completion:*\" rehash true" >> /etc/zshrc'
sh -c 'echo "plugins=(zsh-autosuggestions)" >> /etc/zshrc'

## SSH
sed -i "s/#TCPKeepAlive yes/TCPKeepAlive yes\nClientAliveInterval 60\nClientAliveCountMax 120/g" /etc/ssh/sshd_config
systemctl enable sshd.service
systemctl start sshd.service

# vim
dnf install -y git vim ctags
git clone --depth=1 https://github.com/lolisound/vim-config.git
cd vim-config
bash ./install.sh
cd ..

## Oh My Zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sudo sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="ys"/g' ~/.zshrc
