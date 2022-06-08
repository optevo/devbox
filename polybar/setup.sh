#!/bin/sh
echo "Installing polybar, a status bar"
if [ $(id -u) = 0 ]; then
   echo "Must not be run as root"
   exit 1
fi
sudo apt -q --no-install-recommends install -y polybar
cd "${0%/*}"; rsync -avq ./ ~ --exclude=$0 # copy current directory (except this script) to $HOME
chmod +x $HOME/.config/polybar/launch.sh
