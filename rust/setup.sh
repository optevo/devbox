#!/bin/sh
# see https://www.rust-lang.org/tools/install
if [ $(id -u) = 0 ]; then
   echo "Must not be run as root"
   exit 1
fi
sudo apt install -y wget
wget -q -O install_rust.sh https://sh.rustup.rs
chmod u+x install_rust.sh
./install_rust.sh -y
. $HOME/.cargo/env
rm ./install_rust.sh
rsync -avq . ~ --exclude=$0
