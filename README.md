# Introduction
The goal of Devbox, is to be the only development tool you'll ever need.

# Why?
The high level problem that Devbox addresses is to to lower the barrier of entry to programming, especially when starting with a new programming language. There are typically a lot of components that need to be installed and configured before a line of code can be written. There are also many options for these tools that are configured in different ways so it's impractical to see what each one does then make it work nicely with other tools.

In practice, Devbox is should be (almost) as easy to get running as installing a typical application. In reality, Devbox is a collection of programming languages and development tools, generally installed in a virtual machine, that have been pre-configured to work well together and let you get started with development in a matter of minutes. It includes an editors/IDEs configured to work with the desired language(s) as well as all the tools and framworks configured and ready to use.

The idea of virtual machine appliances or containerised applications is not new but they are generally built for end user, visual applications.

While Devbox comes with "batteries included" it is designed to support:
- Adding new languages.
- Adding new tools.
- Making customisation of existing tools as simple as possible.

# Architecture
Standard components are applications that make up the core of Devbox. They are not likely to change. Each standard component has been selected from a range of alternatives for specific reasons.

## Standard components
- A virtual machine / hypervisor. [VirtualBox](https://www.virtualbox.org/) and [VMWare Player](https://www.vmware.com/au/products/workstation-player.html) are both free and run on a Windows, MacOS or Linux host.
- A guest operating system: [Debian](https://www.debian.org/). The [stable minimal install](https://www.debian.org/CD/netinst/) has been selected because of its minimal initial footprint, breadth of supported applications and, importantly, its stability.
- A tiling window manager: [i3](https://i3wm.org/). This arranges applications and help give Devbox the feel of a single "application". It can arrange development tools such as the editor, terminal and browser. It enables these to be displayed full-screen or side by side in many different ways. It can also switch between multiple virtual desktops, supports keyboard shorcuts and exposes its features through a configuration file.
- A shell : [Zsh](https://www.zsh.org/). This is used both interactively and for scripting. It is used as it has interactive features that make it useful for development.

As these components are the core of this Devbox; they are not designed to be changed.

## Language specific components (LSCs)
Devbox intends to support mulitple languages. Depending on the langauge, these may include compilers, build tools, runtimes, sdks and other components. These components follow these principles:
- For any given language, if there is only a single component that can be used (e.g. a certain compiler version) it should be easily selectable (ideally by configuration). 
- When components are installed for multiple languages, they should co-exist peacefully and be fully supported by development tools.

## Development tools (DTs)
Devbox intends to support multiple development tools. The primary development tool is the editor or IDE. There are a variety of editors that are popular for development, such as vscode, emacs, vim, to name a few. Devbox is development tool agnostic. These components follow these principles:
- Ideally, the latest stable version of each tool should be supported.
- The tool should support all langauges specific components.

As there may be multiple LSCs and DTs, there could end up being quite a large number of combinations supported. This is an area where the community can help contribute.

# Installation
Create a virtual machine instance with the desired configuration and set the CD drive to point to the Debian minimal install ISO available from [here](https://www.debian.org/CD/netinst/).

Using Debian's graphical installer the following configuration is recommended:
- Host name: host
- User name: user
- Password: pass
- Install in one partition. (Swap can be configured as a swap file rather than a swap partition so that swap size can be easily modified if the RAM of the VM is changed.)
- Don't install any packages as part of this install; these will be setup from in the following sections after Debian has booted.

# Setup root
- Login as root

The following applications will be installed:
- sudo: Easy access to root commands from non root user
- wget: Can download other scripts to execute. Smaller than curl
- zsh: Has autocomplete and other features that makes development easier.
```
apt install -y wget
wget -q -O setup.sh https://raw.githubusercontent.com/optevo/devbox/main/setup.sh
chmod u+x ./setup.sh
./setup.sh

```

## Setup window manager
As already noted, the purpose of this is creating a sort of "development application". As there are a small number of components which have UIs that need to be used (the IDE, a browser and a terminal being the main three), a minimal window manager that supports quick switching between applications, full screen and a variety of shared screen configurations, all with customisable keyboard layouts is desirable. It is also useful to minimise the memory footprint of the virtual machine.

The [i3 window manager](https://i3wm.org/) is flexible, small and easy to configure.
1. `sudo apt install -y i3 xorg open-vm-tools-desktop`
2. `echo ‘exec i3’ > ~/.xsession` # i3 will be executed when X starts.
3. `vi ~/.bash_profile`
4. Add this to `.bash_profile` # X will start on login.
```
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
fi
```

## Steup rust
Install instructions adapted from [here](https://www.rust-lang.org/tools/install).
```
sudo apt install -y wget
wget -q -O install_rust.sh https://sh.rustup.rs
chmod u+x install_rust.sh
./install_rust.sh -y
source $HOME/.cargo/env
```

## Setup vscode
Install instructions adapted from [here](https://code.visualstudio.com/docs/setup/linux).
```
sudo apt install -y wget gpg apt-transport-https
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
sudo apt update
sudo apt install -y code
sudo update-alternatives --set editor /usr/bin/code
```

