# Linode 启用 BBR

BBR是Google开源的TCP拥堵控制算法，于2016年9月开源。
Linux kernel 4.9+ 已支持 tcp_bbr

1. 更换 GRUB 引导
edit >> Boot Settings >> Kernel >> GRUB 2

2. 更新内核
wget && dpkg -i
[`http://kernel.ubuntu.com/~kernel-ppa/mainline/`](http://kernel.ubuntu.com/~kernel-ppa/mainline/)

3. 启用BBR
`echo "net.core.default_qdisc = fq" >> /etc/sysctl.conf`
`echo "net.ipv4.tcp_congestion_control = bbr" >> /etc/sysctl.conf`
`sysctl -p`

4. 查看是否编译了tcp_bbr 模块
**root@localhost:~#** `lsmod | grep tcp_bbr`
tcp_bbr                 6015  13

5. 查看是否启用成功
**root@localhost:~#** `sysctl net.ipv4.tcp_available_congestion_control`
sysctl net.ipv4.tcp_congestion_controlnet.ipv4.tcp_available_congestion_control = bbr cubic reno
**root@localhost:~#** `sysctl net.ipv4.tcp_congestion_control`
net.ipv4.tcp_congestion_control = bbr
**root@localhost:~#** `lsmod | grep bbr`
