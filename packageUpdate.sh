#!/bin/bash

# Linux Bash Update Script v1.0
# Author: Lucas Miserez
# License: GNU General Public License, version 3 (GPL-3.0)
# This script is open-source and free to use. You should never pay for it.

echo "**********************************************************************"
echo "       Linux Bash Update Script v1.0"
echo "       Author: Lucas Miserez"
echo "       License: GNU General Public License, version 3 (GPL-3.0)"
echo "       This script is open-source and free to use."
echo "       You should never pay for it."
echo "**********************************************************************"

if [ "$EUID" -ne 0 ]; then
    echo "This script must be run as the root user."
    exit 1
fi

printf "\nPress any key to start the script...\n"
read -s -n 1

if command -v apt &> /dev/null; then
    echo "Updating apt..."
    sudo apt update
    sudo apt -y upgrade
    echo "apt updated"
else
    echo "no apt, continuing..."
fi

if command -v yum &> /dev/null; then
    echo "Updating yum..."
    sudo yum makecache
    sudo yum -y update
    echo "yum updated"
else
    echo "no yum, continuing..."
fi

if command -v dnf &> /dev/null; then
    echo "Updating dnf..."
    sudo dnf makecache
    sudo dnf -y upgrade
    echo "dnf updated"
else
    echo "no dnf, continuing..."
fi

if command -v pacman &> /dev/null; then
    echo "Updating pacman..."
    sudo pacman -Syu --noconfirm
    echo "pacman updated"
else
    echo "no pacman, continuing..."
fi

if command -v zypper &> /dev/null; then
    echo "Updating Zypper..."
    sudo zypper --non-interactive refresh
    sudo zypper --non-interactive up
else
    echo "no zypper, continuing..."
fi

if command -v flatpak &> /dev/null; then
    echo "Updating flatpak..."
    flatpak update -y    
    echo "flatpak updated"
else
    echo "no flatpak, continuing..."
fi

if command -v snap &> /dev/null; then
    echo "Updating snap..."
    sudo snap refresh
    echo "snap updated"
else
    echo "no snap, continuing..."
fi

echo "Update Script Compleet!"

printf "\nPress any key to exit..."
read -s -n 1

echo 

exit 1

