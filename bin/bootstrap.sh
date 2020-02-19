#!/usr/bin/env bash

set -e

check_and_install_package()
{
    if ! [ -x "$(command -v ${1})" ]; then
        pacman -Sy ${1} --noconfirm
    fi
}

if pacman -Syu --noconfirm; then
    echo "Package database and upgrades succesfully applied"
else
    echo "Error during package database / upgrade, resolve manually"
    exit
fi

check_and_install_package ansible
check_and_install_package git

[ ! -d "/home/$USER/Desktop/projects/tools/manage-me" ] && \
    mkdir -p ~/Desktop/projects/tools/      && \
    git clone "https://github.com/atosz33/manage-me.git" "/home/$USER/Desktop/projects/tools/manage-me"

cd /home/$USER/Desktop/projects/tools/manage-me

ansible-playbook -i hosts init.yml --ask-become-pass

echo "Integration done"
