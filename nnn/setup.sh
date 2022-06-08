#!/bin/sh
echo "Installing nnn, a file manager"
if [ $(id -u) = 0 ]; then
   echo "Must not be run as root"
   exit 1
fi
sudo apt -q --no-install-recommends install -y nnn
cd "${0%/*}"; rsync -avq ./ ~ --exclude=$0 # copy current directory (except this script) to $HOME
