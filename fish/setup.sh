#!/bin/sh
echo "Installing fish"
sudo apt install -y fish
chsh -s $(which fish)
rsync -avq . ~ --exclude=$0
