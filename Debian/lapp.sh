#!/bin/bash
# Linux + Apache + PostgreSQL + PHP

# Apache2
sudo apt-get install -y apache2

# PostgreSQL
sudo apt-get install -y postgresql
pg_ctlcluster 11 main start

# PHP
sudo apt-get install -y php php-pgsql libapache2-mod-php
sudo apt-get install -y php-zip php-xml php-intl php-gd php-curl php-mbstring php-apcu php-intl

# PostgreSQL Settings
find / -name pg_hba.conf
sudo sed -i '85,90s/peer/md5/g' /etc/postgresql/11/main/pg_hba.conf
sudo sed -i '85,90s/ident/md5/g' /etc/postgresql/11/main/pg_hba.conf
systemctl restart postgresql.service
systemctl restart apache2.service
systemctl restart php7.3-fpm.service