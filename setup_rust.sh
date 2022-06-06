#!/bin/sh
# see https://www.rust-lang.org/tools/install
sudo apt install -y wget
wget -q -O install_rust.sh https://sh.rustup.rs
chmod u+x install_rust.sh
./install_rust.sh -y
source $HOME/.cargo/env
rm ./install_rust.sh
