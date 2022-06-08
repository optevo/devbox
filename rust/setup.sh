#!/bin/sh
echo "Installing rust"
# see https://www.rust-lang.org/tools/install
if [ $(id -u) = 0 ]; then
   echo "Must not be run as root"
   exit 1
fi
sudo apt -q --no-install-recommends install -y wget
wget -q -O install_rust.sh https://sh.rustup.rs
chmod u+x install_rust.sh
./install_rust.sh -y -q
. $HOME/.cargo/env
rm ./install_rust.sh
cd "${0%/*}"; rsync -avq ./ ~ --exclude=$0 # copy current directory (except this script) to $HOME
