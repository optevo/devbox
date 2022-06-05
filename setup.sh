#!/bin/sh
apt install -y sudo zsh
adduser user sudo
passwd -d root
passwd -d user
su - user
chsh -s /bin/zsh
echo "Done"
