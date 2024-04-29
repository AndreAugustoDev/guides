#!/bin/bash

# Setup pacman keyring
pacman-key --init
pacman-key --populate archlinux

# Update mirrorlist
curl "https://archlinux.org/mirrorlist/?country=US&protocol=https&ip_version=4&use_mirror_status=on" | cut -c 2- >/etc/pacman.d/mirrorlist

# Update system
pacman -Syu

# Install base packages
# pacman -S base base-devel

# Install AUR Helper 'paru'
# git clone https://aur.archlinux.org/paru.git /tmp/paru
#cd /tmp/paru
#makepkg -si

# Configure user
echo "Set root password:"
passwd

echo "Enabling 'wheel' group to use 'sudo':"
echo '%wheel ALL=(ALL:ALL) NOPASSWD: ALL' >/etc/sudoers.d/wheel

echo "Creating and adding user to 'wheel' group:"
read -p "Enter username: " USERNAME
useradd -m $USERNAME -G wheel

echo "Set password for your user:"
passwd $USERNAME

echo "Installation and configuration completed."
