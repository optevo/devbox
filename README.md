# Introduction
I would love Devbox to rule the world and become the only development tool you'll ever need. However, my far more modest aims are:
- To make it much easier to setup my own development environment
- To enable this to be done as
  - All in one, as automated as possible
  - One by one
  - Support multiple options for languages and editors
This is a pain for me personally and I assume for others. I welcome contributors!

# Architecture
These are the rules. I'm happy to change these if someone can suggested a saner way of organising things early on.
- My target operating system is Debian stable.
- My target window manager is i3
- The setup.sh is intended to be run as root to setup a clean environment. This is intended to run in a fresh install (e.g. in a virtual machine)
- Each folder contains a setup.sh that will install and configure the language/application with sane and useful defaults. These defaults will be opinionated.
- Each application should play nicely with the others meaning
  - Applications/languages should be able to be installed in any order
  - Applications/languages should not interfere with each other
  - Applications/languages should leverage each other where possible
  - Everything should automatically update as much as possible without breaking

# Base Setup
Login as root and execute:

```
apt install -y wget
wget -q -O setup.sh https://raw.githubusercontent.com/optevo/devbox/main/setup.sh
chmod u+x ./setup.sh
./setup.sh

```
