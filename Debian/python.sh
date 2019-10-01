#!/bin/bash

## python
sudo apt-get install -y python3 python3-pip

# other
#apt install -y libapache2-mod-wsgi-py3
update-alternatives --install /usr/bin/python python /usr/bin/python2 1
update-alternatives --install /usr/bin/python python /usr/bin/python3 2
#update-alternatives --install /usr/bin/pip pip /usr/bin/pip3 1

## pip upgrade
pip3 install --upgrade pip
#pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U
