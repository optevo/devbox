#!/bin/sh
echo "Installing i3"
if [ $(id -u) = 0 ]; then
   echo "Must not be run as root"
   exit 1
fi
sudo apt -q install -y i3 xorg dkms linux-headers-$(uname -r) build-essential
cd "${0%/*}"; rsync -avq ./ ~ --exclude=$0 # copy current directory (except this script) to $HOME
