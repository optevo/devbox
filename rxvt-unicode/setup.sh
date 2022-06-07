#!/bin/sh
if [ $(id -u) = 0 ]; then
   echo "Must not be run as root"
   exit 1
fi
sudo apt -q install -y --no-install-recommends rxvt-unicode
cd "${0%/*}"; rsync -avq ./* ~ --exclude=$0 # copy current directory (except this script) to $HOME
