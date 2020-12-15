#!/bin/bash

if [ "$UID" != "0" ]; then
	echo "Error: This script must be run as root !"
	exit 0
fi

# apache2
apt-get install -y apache2

# nginx
apt-get install -y nginx

# postgreSQL
apt-get install -y postgresql
pg_ctlcluster 11 main start

# php
apt-get install -y php php-pgsql libapache2-mod-php
apt-get install -y php-zip php-xml php-intl php-gd php-curl php-mbstring php-apcu php-intl

# PostgreSQL Settings
find / -name pg_hba.conf
sed -i '85,90s/peer/md5/g' /etc/postgresql/11/main/pg_hba.conf
sed -i '85,90s/ident/md5/g' /etc/postgresql/11/main/pg_hba.conf
systemctl restart postgresql.service
systemctl restart apache2.service
systemctl restart php7.3-fpm.service
