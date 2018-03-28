#!/bin/bash

if [[ "$#" -eq 1 ]]
then

    DOTFILES="$HOME/dotfiles"
    cd $DOTFILES/sudo_init

    ./install_packages.sh
    ./get_docker.sh
    ./set_time.sh
    (
    cd ../
    ./gen_ssh_keys
    )
    ./set_machine_name.sh $1

else

    echo "No machine name specified"
    exit 1;

fi
