#!/bin/bash

# 安装依赖
sudo apt install curl gnupg2 ca-certificates lsb-release

# 稳定的Nginx仓库
echo "deb http://nginx.org/packages/debian `lsb_release -cs` nginx" \
    | sudo tee /etc/apt/sources.list.d/nginx.list

# 导入官方的签名密钥
curl -o /tmp/nginx_signing.key https://nginx.org/keys/nginx_signing.key

# 验证下载的文件是否包含正确的密钥
gpg --dry-run --quiet --import --import-options import-show /tmp/nginx_signing.key
# 输出应包含完整的指纹 573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62

# 将密钥移动到 apt 可信密钥存储
sudo mv /tmp/nginx_signing.key /etc/apt/trusted.gpg.d/nginx_signing.asc

# 安装 nginx
sudo apt update
sudo apt install nginx

# 启动服务
systemctl start nginx

# 开机启动
systemctl enable nginx