# Fedora32 Auto Install

## Test is Fedora
source /etc/os-release
if [ "$ID" != "fedora" ]; then
    echo "Not Fedora!"
    exit 1
fi

## Source Tuna.moe
cp /etc/yum.repos.d/fedora.repo /etc/yum.repos.d/fedora.repo.bak
echo "[fedora]
name=Fedora \$releasever - \$basearch
failovermethod=priority
baseurl=https://mirrors.tuna.tsinghua.edu.cn/fedora/releases/\$releasever/Everything/\$basearch/os/
metadata_expire=28d
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-\$releasever-\$basearch
skip_if_unavailable=False" > /etc/yum.repos.d/fedora.repo
cp /etc/yum.repos.d/fedora-updates.repo /etc/yum.repos.d/fedora-updates.repo.bak
echo "[updates]
name=Fedora \$releasever - \$basearch - Updates
failovermethod=priority
baseurl=https://mirrors.tuna.tsinghua.edu.cn/fedora/updates/\$releasever/Everything/\$basearch/
enabled=1
gpgcheck=1
metadata_expire=6h
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-\$releasever-\$basearch
skip_if_unavailable=False" > /etc/yum.repos.d/fedora-updates.repo
cp /etc/yum.repos.d/fedora-modular.repo /etc/yum.repos.d/fedora-modular.repo.bak
echo "[fedora-modular]
name=Fedora Modular \$releasever - \$basearch
failovermethod=priority
baseurl=https://mirrors.tuna.tsinghua.edu.cn/fedora/releases/\$releasever/Modular/\$basearch/os/
enabled=1
metadata_expire=7d
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-\$releasever-\$basearch
skip_if_unavailable=False" > /etc/yum.repos.d/fedora-modular.repo
cp /etc/yum.repos.d/fedora-updates-modular.repo /etc/yum.repos.d/fedora-updates-modular.repo.bak
echo "[updates-modular]
name=Fedora Modular \$releasever - \$basearch - Updates
failovermethod=priority
baseurl=https://mirrors.tuna.tsinghua.edu.cn/fedora/updates/\$releasever/Modular/\$basearch/
enabled=1
gpgcheck=1
metadata_expire=6h
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-\$releasever-\$basearch
skip_if_unavailable=False" > /etc/yum.repos.d/fedora-updates-modular.repo

dnf makecache
dnf upgrade -y

## Proxy
export ALL_PROXY="socks5://192.168.0.120:1080"
export http_proxy="socks5://192.168.0.120:1080"
export https_proxy="socks5://192.168.0.120:1080"

## BBR
echo "net.core.default_qdisc = fq" >> /etc/sysctl.conf
echo "net.ipv4.tcp_congestion_control = bbr" >> /etc/sysctl.conf
sysctl -p

# sudo
echo "$username  ALL=(ALL:ALL)  NOPASSWD:ALL" >> /etc/sudoers

## Git
dnf install -y git wget curl
git config --global user.name "lolisound"
git config --global user.email "lolisound@gmail.com"
git config --global color.ui true
git config --global push.default simple
git config --global core.autocrlf input
git config --global core.safecrlf true
git config --global http.proxy 'socks5://192.168.0.120:1080'
git config --global https.proxy 'socks5://192.168.0.120:1080'
su - misaka -c "git config --global user.name \"lolisound\""
su - misaka -c "git config --global user.email \"lolisound@gmail.com\""
su - misaka -c "git config --global color.ui true"
su - misaka -c "git config --global push.default simple"
su - misaka -c "git config --global core.autocrlf input"
su - misaka -c "git config --global core.safecrlf true"
su - misaka -c "git config --global http.proxy 'socks5://192.168.0.120:1080'"
su - misaka -c "git config --global https.proxy 'socks5://192.168.0.120:1080'"

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
sh -c 'echo "source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> /etc/zsh/zshrc'
sh -c 'echo "setopt no_nomatch" >> /etc/zsh/zshrc'
sh -c 'echo "zstyle \": completion:*\" rehash true" >> /etc/zsh/zshrc'
sh -c 'echo "plugins=(zsh-autosuggestions)" >> /etc/zsh/zshrc'

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
