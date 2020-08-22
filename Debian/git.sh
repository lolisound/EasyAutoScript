#!/bin/bash

## Read parameters
echo "Enter your github username:"
read git_username
echo "Enter your email:"
read git_email

## git
sudo apt-get install -y git wget curl

## Setting
git config --global user.name \"$git_username\"
git config --global user.email \"$git_email\"
git config --global color.ui true
git config --global push.default simple
git config --global core.autocrlf input
git config --global core.safecrlf true


## 全局代理
# git config --global http.proxy 'socks5://127.0.0.1:1080' 
# git config --global https.proxy 'socks5://127.0.0.1:1080'

## 取消全局代理
# git config --global --unset http.proxy
# git config --global --unset https.proxy

## 仓库内使用代理
# git config --local http.proxy 'socks5://127.0.0.1:1080' 
# git config --local https.proxy 'socks5://127.0.0.1:1080'

## 取消仓库内代理
# git config --local --unset http.proxy
# git config --local --unset https.proxy