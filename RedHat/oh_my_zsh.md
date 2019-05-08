# Oh My Zsh

```bash
yum install -y git curl zsh
sh -c 'echo "setopt no_nomatch" >> /etc/zshrc'
sh -c 'echo "zstyle \":completion:*\" rehash true" >> /etc/zshrc'
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```
