#!/bin/bash
set -e

if ! [ -x "$(command -v ansible)" ]; then
    sudo pacman --noconfirm -Syu ansible
    sudo pacman --noconfirm -Syu ansible-core
    ansible-galaxy collection install community.general
fi
