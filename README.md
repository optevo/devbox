# Introduction
I would love Devbox to rule the world and become the only development tool you'll ever need. However, my far more modest aims are:
- To make it much easier to setup my own fully configured development environment from scratch. This is a pain for me personally and I assume for others.
- To enable applications and languages to be setup;
  - In one go and make this as automated as possible.
  - One tool or language at a time.

Some aspects of this setup are highly opinionated - I only want one configuration setup (the best!) per language/tool.
But I want the setup scripts themselves to work in a modular way - you should be able to choose any combination of languages and tools and have them play nicely with each other.

I'd like each language or tool to auto-update as much as possible (with minimal risk of breaking).

I welcome contributors! As I've mentioned, each tool or language will only have ever one configuration - the one I like the most. I'm happy to discuss how a specific tool or language is best configured and if I like it, I'll inlcude it. If not, you can always fork! :)

# Base Setup
To setup a clean, minimal install of Debian stable (presumably running in a virtual machine), login as root and execute:

```
apt install -y wget
wget -O - setup.sh https://raw.githubusercontent.com/optevo/devbox/main/setup.sh | sh

```
