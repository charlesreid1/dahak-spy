#!/bin/bash
# 
# install some essential packages

if [ "$(id -u)" != "0" ]; then
    echo ""
    echo ""
    echo "This script should be run as root."
    echo ""
    echo ""
    exit 1;
fi

apt-get update
apt-get install -y git 
apt-get install -y vim
apt-get install -y screen
apt-get install -y aptitude
apt-get install -y build-essential
apt-get install -y curl
apt-get install -y wget

apt -y autoremove
