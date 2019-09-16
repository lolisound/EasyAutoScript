#!/bin/bash

## 输入法
sudo apt-get install -y ibus-rime

##  候选词数量为9
mkdir -p ~/.config/ibus/rime
echo -e "patch:\n  \"menu/page_size\": 9" > ~/.config/ibus/rime/default.custom.yaml
ibus-daemon -drx
