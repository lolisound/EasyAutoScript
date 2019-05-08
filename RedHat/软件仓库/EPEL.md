# 企业版 Linux 附加软件包（EPEL）

企业版 Linux 附加软件包（以下简称 EPEL）是一个 Fedora 特别兴趣小组，用以创建、维护以及管理针对企业版 Linux 的一个高质量附加软件包集，面向的对象包括但不限于 红帽企业版 Linux (RHEL)、 CentOS、Scientific Linux (SL)、Oracle Linux (OL) 。

## RHEL/CentOS 7 启用 EPEL 仓库

```bash
# 安装
yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
# 确认 EPEL 已启用
yum repolist
```

## 清华大学 EPEL 镜像

```bash
yum install epel-release
```

当前tuna已经在epel的官方镜像列表里，所以不需要其他配置，mirrorlist机制就能让你的服务器就近使用tuna的镜像。如果你想强制 你的服务器使用tuna的镜像，可以修改 `/etc/yum.repos.d/epel.repo` ，将 `baseurl` 开头的行取消注释（删掉#），并注释 `mirrorlist` 开头的行（在头部加一个#）。

接下来，把这个文件里的 `http://download.fedoraproject.org/pub` 替换成 `https://mirrors.tuna.tsinghua.edu.cn` 即可。

修改结果

```bash
[epel]
name=Extra Packages for Enterprise Linux 7 - $basearch
baseurl=https://mirrors.tuna.tsinghua.edu.cn/epel/7/$basearch
#mirrorlist=https://mirrors.fedoraproject.org/metalink?repo=epel-7&arch=$basearch
failovermethod=priority
enabled=1
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7

[epel-debuginfo]
name=Extra Packages for Enterprise Linux 7 - $basearch - Debug
baseurl=https://mirrors.tuna.tsinghua.edu.cn/epel/7/$basearch/debug
#mirrorlist=https://mirrors.fedoraproject.org/metalink?repo=epel-debug-7&arch=$basearch
failovermethod=priority
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7
gpgcheck=1

[epel-source]
name=Extra Packages for Enterprise Linux 7 - $basearch - Source
baseurl=https://mirrors.tuna.tsinghua.edu.cn/epel/7/SRPMS
#mirrorlist=https://mirrors.fedoraproject.org/metalink?repo=epel-source-7&arch=$basearch
failovermethod=priority
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7
gpgcheck=1
```
