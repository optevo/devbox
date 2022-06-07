#!/bin/sh
echo "Installing fish"
if [ $(id -u) = 0 ]; then
   echo "Must not be run as root"
   exit 1
fi
sudo apt -q install -y --no-install-recommends fish
chsh -s $(which fish)
cd "${0%/*}"; rsync -avq ./* ~ --exclude=$0 # copy current directory (except this script) to $HOME
