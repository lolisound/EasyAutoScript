# 软件集（SCL）存储库

企业Linux发行版的设计目标已存在很长时间。它们还旨在维护分发生命周期内的ABI / API兼容性，以便您可以在发布的第1天创建自己的自定义程序，并且只要支持分发，就可以使用它们。对于目前为期10年的CentOS。然而，这意味着，在分发的生命周期结束时，包含的编程语言或数据库版本（包括php，python，perl或mysql，postgresql）与“尖端”中可用的版本相比变得非常老旧。 Linux发行版。
<https://wiki.centos.org/AdditionalResources/Repositories/SCL>

```bash
yum -y install centos-release-scl.noarch
```

**这个库其实没啥卵用**
