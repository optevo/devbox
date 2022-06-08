#!/bin/sh
echo "Installing firacode-font, a monospace font"
if [ $(id -u) = 0 ]; then
   echo "Must not be run as root"
   exit 1
fi
sudo apt -q install -y --no-install-recommends firacode-font
cd "${0%/*}"; rsync -avq ./ ~ --exclude=$0 # copy current directory (except this script) to $HOME
