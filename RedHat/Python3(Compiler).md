# Python 编译安装
<https://www.python.org/>

```bash
# 检查系统默认 Python 版本
python -V
# 下载最新的 Python
## https://www.python.org/downloads/
wget https://www.python.org/ftp/python/3.7.3/Python-3.7.3.tar.xz
# 解压
tar -xvf Python-3.7.3.tar.xz
# 切换目录
cd ./Python-3.7.3
# 编译并安装
./configure –prefix=/usr/local/python-3.7.3
make all
make install
make clean
make distclean
```
