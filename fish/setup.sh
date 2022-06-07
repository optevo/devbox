#!/bin/sh
echo "Installing fish"
if [ $(id -u) = 0 ]; then
   echo "Must not be run as root"
   exit 1
fi
sudo apt install -y fish
chsh -s $(which fish)
rsync -avq . ~ --exclude=$0
