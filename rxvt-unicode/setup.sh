#!/bin/sh
if [ $(id -u) = 0 ]; then
   echo "Must not be run as root"
   exit 1
fi
