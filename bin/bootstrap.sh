#!/usr/bin/env bash

set -e

if ! [ -x "$(command -v ansible)" ]; then
    pacman -Sy ansible
fi

if ! [ -x "$(command -v git)" ]; then
    pacman -Sy git
fi

[ ! -d "~/Desktop/projects/tools/manage-me" ] && \
    mkdir -p ~/Desktop/projects/tools/      && \
    git clone "https://github.com/atosz33/manage-me.git" "~/Desktop/projects/tools"

cd ~/Desktop/projects/tools/manage-me

ansible-playbook -i hosts init.yml --ask-become-pass

echo "Integration done"
