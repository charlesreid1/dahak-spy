#!/bin/bash
#
# boot-to-dahak-spy script
# 
# This script is intended to get you from
# bare metal to a machine ready to run
# dahak workflows (including dotfiles, scripts,
# python, snakemake, and singularity.)
#
# Run as a one-shot installer:
# bash <( curl https://raw.githubusercontent.com/charlesreid1/dahak-spy/master/cloud_init/cloud_init.sh )
set -x

# ubuntu AMI provides this non-root user by default :)
USER="ubuntu"

# first things first
apt-get update
apt-get install -y git

# get copy of spy for root user
DOTFILES="$HOME/dotfiles"
git clone https://github.com/charlesreid1/dahak-spy $DOTFILES

# run root init script
$DOTFILES/tasks_sudo/sudo_init.sh dahak-spy

# copy the user init script
cp $DOTFILES/tasks_user/user_init.sh /home/$USER/.
chown $USER:$USER /home/$USER/user_init.sh

# run user init script as user
sudo -H -i -u $USER /home/$USER/user_init.sh

