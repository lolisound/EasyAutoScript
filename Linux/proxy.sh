#!/bin/bash

# localhost
export ALL_PROXY="socks5://127.0.0.1:1080"
export http_proxy="socks5://127.0.0.1:1080"
export https_proxy="socks5://127.0.0.1:1080"

git config --global http.proxy 'socks5://127.0.0.1:1080'
git config --global https.proxy 'socks5://127.0.0.1:1080'


# LAN
export ALL_PROXY="socks5://192.168.0.120:1080"
export http_proxy="socks5://192.168.0.120:1080"
export https_proxy="socks5://192.168.0.120:1080"

git config --global http.proxy 'socks5://192.168.0.120:1080'
git config --global https.proxy 'socks5://192.168.0.120:1080'