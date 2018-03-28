#!/bin/sh

echo "If you have not done so already, "
echo "set a password for this account"
echo "by running:"
echo ""
echo "    $ sudo passwd ubuntu"
echo ""

# Actually make the swap directory vim is going to use
mkdir -p ~/.vim/swap
mkdir -p ~/.vim/undo
mkdir -p ~/.vim/backups


