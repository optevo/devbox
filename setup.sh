#!/bin/sh
apt install -y sudo zsh
adduser user sudo
echo "Hello 1"
passwd -d root
passwd -d user
chsh -s /bin/zsh user
echo "Hello 2"
