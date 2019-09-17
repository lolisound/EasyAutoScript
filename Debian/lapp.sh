#!/bin/bash
# Linux + Apache + PostgreSQL + PHP

# Apache2
sudo apt-get install -y apache2

# PostgreSQL
sudo apt-get install -y postgresql

# PHP
sudo apt-get install -y php php-pgsql libapache2-mod-php
sudo apt-get install -y php-zip php-xml php-intl php-gd php-curl php-mbstring php-apcu php-intl

# PostgreSQL Settings
sudo sed -i '85,90s/peer/md5/g' `find / -name pg_hba.conf`
sudo sed -i '85,90s/ident/md5/g' `find / -name pg_hba.conf`
