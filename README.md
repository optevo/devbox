# Common development setup
How to set up a general development environment.

# Principles
The development environment will run in a virtual machine such as [VirtualBox](https://www.virtualbox.org/) or [VMWare Player](https://www.vmware.com/au/products/workstation-player.html). There are many reasons for running a development environment in a virtual machine:
- Uses a clean, dediated operating system which can be set up with the language toolchain and libraries, IDE, Window Manager, Shell, Colour Schemas, Browsers and other software that can be customised as needed.
- Is not polluted by installs made on the host operating system.
- Can be copied to other hosts.

Configure the VM with the desired amount of RAM and Disk Space and point the CD to use the Guest Operating System ISO.

# Guest Operating System - Debian Linux
Preferred because:
- There is a strong focus on stability.
- It supports most necessary development components (with the exception of MacOS or Windows specific development)

The minimal ISO image can be downloaded from [here](https://www.debian.org/CD/netinst/)

# Debian base installation
Using the graphical installer the following configuration is recommended:
- Host name: host
- User name: user
- Password: pass
- Install in one partition. Swap can be configured as a swap file rather than a swap partition so that swap size can be easily modified if the RAM of the VM is changed.
- Don't install any packages; these will be setup from scratch in the next section.

# Base setup
Setup as follows order:

## Setup sudo
To avoid unintentionally modifying the operating system, install sudo.

1. Login as root
2. `apt install -y sudo`
3. `adduser user sudo`
4. `reboot now`
5. Login as user

## Setup autologin
It there is only one user and security within the guest operating system is not important, autologin can be setup as follows:
1. `cd /etc/systemd/system/getty.target.wants`
2. `sudo vi getty@tty1.service`
3. Change the line that starts with `ExecStart=-/sbin/agetty`... to `ExecStart=-/sbin/agetty -a USERNAME %I 38400`
4. `reboot now`

## Setup window manager
As there are a small number of applications with UIs that need to be used (the IDE, a browser and a terminal being the main three), a minimal window manager that supports quick switching between applications, full screen and a variety of shared screen configurations, all with customisable keyboard layouts is desirable.
The [i3 window manager](https://i3wm.org/) is flexible and easy to configure.
1. `sudo apt install -y i3 xorg`
2. `echo ‘exec i3’ > ~/.xsession`
3. `vi ~/.bash_profile`
4. Add this to `.bash_profile`
```
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
fi
```

If VMWare is used:
`sudo apt install -y open-vm-tools-desktop`

## Steup rust
Install instructions copied from [here](https://www.rust-lang.org/tools/install).
```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

## Setup vscode
Install instructions copied from [here](https://code.visualstudio.com/docs/setup/linux).
```
sudo apt install -y wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
```

