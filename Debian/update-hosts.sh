#!/bin/bash
wget -O /etc/hosts https://raw.githubusercontent.com/googlehosts/hosts/master/hosts-files/hosts
echo "127.0.1.1       raspberrypi" >> /etc/hosts
