#!/bin/bash

if [ ! -d ~/.dotfiles ]; then
    echo "Please rename this directory as ~/.dotfiles before running this script"
    exit 1
fi

echo -e "\nsource ~/.dotfiles/aliases" >> ~/.bash_profile
echo -e "source ~/.dotfiles/bash_profile\n" >> ~/.bash_profile

source ~/.bash_profile
