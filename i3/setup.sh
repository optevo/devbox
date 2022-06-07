#!/bin/sh
if [ $(id -u) = 0 ]; then
   echo "Must not be run as root"
   exit 1
fi
sudo apt install -y i3 xorg open-vm-tools-desktop
echo ‘exec i3’ > ~/.xsession # i3 will be executed when X starts.
rsync -avq . .. --exclude=$0
