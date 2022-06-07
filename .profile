#!/bin/sh
#This .profile will run once then delete itself. We assume the shell is being changed to one that does not use .profile (e.g. zsh or fish) as part of the setup
echo "I'm running once"
rm $0
sudo reboot now
