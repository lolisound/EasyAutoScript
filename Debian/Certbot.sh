# Let's Encrypt - Certbot

## Nginx on Debian 10 (buster)
## https://certbot.eff.org/lets-encrypt/debianbuster-nginx.html


# 安装 snap
sudo apt update
sudo apt install snapd

# 注销并重新登录，或重新启动系统，以确保正确更新 snap 的路径
sudo snap install core

# 确保您的 snapd 版本是最新的
# sudo snap install core; sudo snap refresh core

# 删除 certbot-auto 和任何 Certbot OS 包
sudo apt-get remove certbot


# 安装 Certbot
sudo snap install --classic certbot

# 准备 Certbot 命令
sudo ln -s /snap/bin/certbot /usr/bin/certbot

# 运行此命令以获取证书并让 Certbot 自动编辑您的 Nginx 配置以提供服务
sudo certbot --nginx

# 测试自动续订
sudo certbot renew --dry-run

