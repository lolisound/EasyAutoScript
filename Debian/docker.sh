# 卸载旧版本
sudo apt-get remove docker docker-engine docker.io containerd runc

# 更新apt软件包索引并安装软件包以允许apt通过HTTPS使用存储库

sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common -y

# 添加Docker的官方GPG密钥
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

# 设置稳定的存储库
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"

# 安装DOCKER引擎
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io -y


# 便捷脚本
# Raspbian 必须使用脚本安装
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh