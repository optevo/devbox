#!/bin/sh
sudo apt install -y i3 xorg open-vm-tools-desktop
echo ‘exec i3’ > ~/.xsession # i3 will be executed when X starts.
