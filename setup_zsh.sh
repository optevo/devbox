#!/bin/sh
sudo apt install -y zsh git
wget -O https://raw.githubusercontent.com/optevo/devbox/main/.zshenv
# Oh My Zsh
wget -O install_ohmyzsh.sh https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
chmod ./install_ohmyzsh.sh
./install_ohmyzsh.sh

# https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh

chsh -s $(which zsh)
su - user
