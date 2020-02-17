#!/usr/bin/env bash

set -e

if ! [ -x "$(command -v ansible)" ]; then
    pacman -Sy ansible
fi

if ! [ -x "$(command -v git)" ]; then
    pacman -Sy git
if

[ -d "~/Desktop/projects/tools/manage-me" ] && git clone "https://github.com/atosz33/manage-me.git" "~/Desktop/projects/tools"

cd ~/Desktop/projects/tools/manage-me

ansible-playbook -i hosts dotfiles.yml --ask-become-pass

echo "Integration done"
