#!/bin/bash
#
# initialize all the dotfiles stuff for user 
set -x

SPY="$HOME/dahak-spy"
git clone https://github.com/charlesreid1/dahak-spy $SPY

cd $SPY/tasks_user

./pre_bootstrap.sh
(
cd ../
./bootstrap.sh -f
./gen_ssh_keys.sh
)
./install_netdata.sh
./install_pyenv.py

