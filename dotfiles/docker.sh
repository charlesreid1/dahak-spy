#!/bin/bash
# 
# https://get.docker.com/
# 
curl -fsSL get.docker.com -o get-docker.sh
sh get-docker.sh
sudo usermod -aG docker ubuntu
rm -f get-docker.sh

echo ""
echo ""
echo "Time to do the hokey pokey. Log out and log back in."
echo ""
echo ""
