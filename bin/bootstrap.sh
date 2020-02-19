#!/usr/bin/env bash

set -e

install_package()
{
    pacman -Sy ${1} --noconfirm
}

if ! [ -x "$(command -v ansible)" ]; then
    pacman -Syu --noconfirm && install_package ansible
fi

if ! [ -x "$(command -v git)" ]; then
    install_package git
fi

[ ! -d "/home/$USER/Desktop/projects/tools/manage-me" ] && \
    mkdir -p ~/Desktop/projects/tools/      && \
    git clone "https://github.com/atosz33/manage-me.git" "/home/$USER/Desktop/projects/tools"

cd /home/$USER/Desktop/projects/tools/manage-me

ansible-playbook -i hosts init.yml --ask-become-pass

echo "Integration done"
