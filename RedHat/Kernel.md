# CentOS 7 upgrade Kernel

## 系统升级及查看当前内核版本

```bash
# 升级和更新 CentOS 7
yum -y update
yum -y install yum-plugin-fastestmirror

# 检查当前内核版本
cat /etc/redhat-release
cat /etc/os-release
uname -msr
```

## 添加ELRepo存储库

[ELRepo](http://elrepo.org/tiki/tiki-index.php)包含了硬件相关RHEL系软件包，文件系统驱动程序，图形驱动程序，网络驱动程序，声音驱动程序，网络摄像头和视频驱动等

```bash
# 导入密钥
rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org

# 安装 ELRepo
yum install https://www.elrepo.org/elrepo-release-7.0-3.el7.elrepo.noarch.rpm

# 确认 ELPrepo 已启用
yum repolist
```

## 安装新的内核

kernel-ml 为主线稳定版本（mainline stable）
kernel-lt 为长期支持版本（long term support）

当提示类似无法找到头文件时，需要安装`kernel-ml-devel`或`kernel-lt-devel`
(your kernel headers for kernel xxx cannot be found ...)

```bash
# 安装内核
yum --enablerepo=elrepo-kernel install kernel-ml
## yum --enablerepo=elrepo-kernel install kernel-lt

# 使用awk命令检查所有可用的内核版本
sudo awk -F\' '$1=="menuentry " {print i++ " : " $2}' /etc/grub2.cfg

# 修改Grub启动的默认值
sudo grub2-set-default 0

## 生成Grub2配置，然后重启系统
sudo grub2-mkconfig -o /boot/grub2/grub.cfg
sudo reboot
```

## 确认内核版本是否升级成功

```bash
# 确认内核版本
uname -msr
# 删除旧内核
yum install yum-utils
package-cleanup --oldkernels
```
