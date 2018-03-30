#!/bin/bash
#
# initialize all the dotfiles stuff for user 
set -x

DOTFILES="$HOME/dotfiles"
mkdir -p $DOTFILES

SPY="$DOTFILES/dahak-spy"
git clone https://github.com/charlesreid1/dahak-yeti $SPY

cd $SPY/tasks_user

./pre_bootstrap.sh
(
cd ../
./bootstrap.sh -f
./gen_ssh_keys.sh
)
./install_netdata.sh
./install_pyenv.py

