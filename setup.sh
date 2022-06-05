#!/bin/sh
apt update
apt install -y sudo zsh
adduser user sudo # enable sudo for user 'user'
sed -i "s/ExecStart=.*/ExecStart=-\/sbin\/agetty -a user %I/g" /lib/systemd/system/getty@.service # user will auto-login
passwd -d root # The user 'root' can now switch to root (e.g. use su or sudo) without a password
passwd -d user # The user 'user' can now switch to user without a password
sed -i "s/GRUB_TIMEOUT=.*/GRUB_TIMEOUT=0/g" /etc/default/grub # Set boot timeout to 0
update-grub
reboot now
