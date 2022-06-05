#!/bin/sh
apt update
apt install -y sudo zsh
adduser user sudo
passwd -d root
passwd -d user
su - user
