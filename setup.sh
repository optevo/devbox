#!/bin/sh
if ! [ $(id -u) = 0 ]; then
   echo "This script must be run as root"
   exit 1
fi
passwd -d root # The user 'root' can now switch to root (e.g. use su or sudo) without a password
apt update
apt install -y sudo git rsync

# Add user 'user' if they don't exist, add them to 'sudo' group, delete the 'user' password (if any) and setup 'user' for auto-login
adduser user >/dev/null 2>&1 # Add user "user" if they don't exist
adduser user sudo # enable sudo for user 'user'
sed -i "s/ExecStart=.*/ExecStart=-\/sbin\/agetty -a user %I/g" /lib/systemd/system/getty@.service # user will auto-login
passwd -d user # The user 'user' can now switch to user without a password

# Set boot timeout to 0
sed -i "s/GRUB_TIMEOUT=.*/GRUB_TIMEOUT=0/g" /etc/default/grub
update-grub

# Setup a script to run once when user 'user' logs in
wget -q -O /home/user/runonce.sh https://raw.githubusercontent.com/optevo/devbox/main/runonce.sh
chown user /home/user/runonce.sh
chmod a+wrx /home/user/runonce.sh
echo "if [ -e  /home/user/runonce.sh ] && [ \$(tty) = \"/dev/tty1\" ] ; then" >> /home/user/.bashrc
echo "  /home/user/runonce.sh" >> /home/user/.bashrc
echo "fi" >> /home/user/.bashrc
reboot now # reboot and (auto)login as user 'user' to complete setup
