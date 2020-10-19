#!/bin/bash

git config --global user.name "lolisound"
git config --global user.email "lolisound@gmail.com"
git config --global color.ui true
git config --global push.default simple
git config --global core.autocrlf input
git config --global core.safecrlf true

## set global proxy
# git config --global http.proxy 'socks5://127.0.0.1:1080' 
# git config --global https.proxy 'socks5://127.0.0.1:1080'

## unset global proxy
# git config --global --unset http.proxy
# git config --global --unset https.proxy

## set proxy in git repository
# git config --local http.proxy 'socks5://127.0.0.1:1080' 
# git config --local https.proxy 'socks5://127.0.0.1:1080'

## unset proxy in git repository
# git config --local --unset http.proxy
# git config --local --unset https.proxy
