#!/bin/sh
#This will run once then delete itself. We assume the shell is being changed to one that does not use .profile (e.g. zsh or fish) as part of the setup
git clone https://github.com/optevo/devbox
cd ~/devbox
chmod u+x $(ls */setup.sh)
nnn/setup.sh
fish/setup.sh
tmux/setup.sh
rust/setup.sh
i3/setup.sh
firacode-font/setup.sh
rofi/setup.sh
chromium/setup.sh
firefox-esr/setup.sh
rxvt-unicode/setup.sh
vscode/setup.sh
cd ~
#sudo rm -r devbox
#rm $0
#sudo reboot now
