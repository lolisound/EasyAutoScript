#!/bin/bash
# Linux + Nginx + PostgreSQL + PHP

# Nginx
sudo apt-get install -y install nginx

# PostgreSQL
sudo apt-get install -y install postgresql

# PHP
sudo apt-get install -y install php php-pgsql libapache2-mod-php
sudo apt-get install -y install php-zip php-xml php-intl php-gd php-curl php-mbstring php-apcu php-intl

# PostgreSQL Settings
sudo sed -i '85,90s/peer/md5/g' `find / -name pg_hba.conf`
sudo sed -i '85,90s/ident/md5/g' `find / -name pg_hba.conf`