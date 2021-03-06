#!/bin/bash

install_via_brew_or_yum() {
    package=$1

    # Install bash-completion
    if type brew &> /dev/null; then
        brew install $package
    elif type yum &> /dev/null; then
        yum install -y $package
    else
        echo "Could not download $package on this system because there is no brew or yum present; need to find another way"
    fi
}


main() {
    if [ ! -d ~/.dotfiles ]; then
        echo "Please rename this directory as ~/.dotfiles before running this script"
        exit 1
    fi

    # Download packages with a package manager
    for package in $(cat brew_packages.txt); do
        install_via_brew_or_yum $package;
    done

    # ctags requires an alternative brew install 
    if type brew &> /dev/null; then
        brew install --HEAD universal-ctags/universal-ctags/universal-ctags
    fi

    # Set up the source commands in the system bash_profile
    echo -e "\nsource ~/.dotfiles/aliases.sh" >> ~/.bash_profile
    echo -e "source ~/.dotfiles/bash_profile\n" >> ~/.bash_profile

    source ~/.bash_profile
}

main
