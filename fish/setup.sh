#!/bin/sh
sudo apt install -y fish
chsh -s $(which fish)
cp -r !(setup.sh) ..
