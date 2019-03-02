#!/bin/bash

# Read parameters
echo "Enter your github username:"
read git_username
echo "Enter your email:"
read git_email

# Setting
git config --global user.name \"$git_username\"
git config --global user.email \"$git_email\"
git config --global color.ui true
git config --global push.default simple
git config --global core.autocrlf input
git config --global core.safecrlf true
