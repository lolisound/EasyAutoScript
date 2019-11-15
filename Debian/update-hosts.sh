#!/bin/bash
wget -O /etc/hosts https://raw.githubusercontent.com/googlehosts/hosts/master/hosts-files/hosts
echo "127.0.0.1    `cat /etc/hostname`" >> /etc/hosts
