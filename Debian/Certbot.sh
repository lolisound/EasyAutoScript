# Let's Encrypt - Certbot

## Nginx on Debian 10 (buster)
## https://certbot.eff.org/lets-encrypt/debianbuster-nginx.html


# 安装Certbot
apt-get install certbot python-certbot-nginx -y

# 获取证书，并让Certbot自动编辑Nginx配置以为其提供服务
certbot --nginx

## 只获取证书
# certbot certonly --nginx

# 测试自动续订
certbot renew --dry-run
