#!/bin/bash

# onedrive
# https://github.com/abraunegg/onedrive

# ubuntu:PPA
sudo add-apt-repository ppa:yann1ck/onedrive
sudo apt-get update
sudo apt install onedrive -y

# 显示你的配置
onedrive --display-config

# 执行同步
onedrive --synchronize

# 增加日志记录级别
onedrive --synchronize --verbose

# 本地文件存储~/OneDrive为“真实来源”
onedrive --synchronize --local-first

# 作为系统服务运行
systemctl --user enable onedrive
systemctl --user start onedrive

# 以非root用户作为系统服务运行
systemctl enable onedrive@<username>.service
systemctl start onedrive@<username>.service
