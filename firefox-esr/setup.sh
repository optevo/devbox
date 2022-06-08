#!/bin/sh
echo "Installing firefox-esr, a web browser"
if [ $(id -u) = 0 ]; then
   echo "Must not be run as root"
   exit 1
fi
sudo apt -q --no-install-recommends install -y firefox-esr
cd "${0%/*}"; rsync -avq ./ ~ --exclude=$0 # copy current directory (except this script) to $HOME
