#!/bin/sh
sudo apt install -y zsh git
wget -O https://raw.githubusercontent.com/optevo/devbox/main/.zshenv
wget -O install_ohmyzsh.sh https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
chmod ./install_ohmyzsh.sh
