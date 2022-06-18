#!/bin/sh
echo "Installing tmux, a terminal multiplexer"
if [ $(id -u) = 0 ]; then
   echo "Must not be run as root"
   exit 1
fi
sudo apt -q install -y tmux
cd "${0%/*}"; rsync -avq ./ ~ --exclude=$0 # copy current directory (except this script) to $HOME
