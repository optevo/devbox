#!/bin/sh
echo "Installing i3"
if [ $(id -u) = 0 ]; then
   echo "Must not be run as root"
   exit 1
fi
sudo apt -q install -y --no-install-recommends i3 xorg open-vm-tools-desktop
echo ‘exec i3’ > ~/.xsession # i3 will be executed when X starts.
cd "${0%/*}"; rsync -avq ./* ~ --exclude=$0 # copy current directory (except this script) to $HOME
