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

## Setup sudo
Even if passwords are removed, it is still convenient to be able to access commands that require root access via sudo. Many scripts use sudo so it has become something of a defacto standard.

1. Login as root
2. `apt update`
3. `apt install -y sudo`
4. `adduser user sudo`
5. `reboot now`
6. Login as user


## Remove passwords
The purpose of the virtual machine is a single user development environment which is intended to function more like an application than an operating system. Therefore it is preferable in most cases that passwords are removed. It also allows for the easy creation of scripts with sudo commands that do not require prompting for a password. The virtual machine can be protected in other ways, not least of which are the access controls of the host operating system.

1. Login as user
2. `sudo passwd -d root`
3. `sudo passwd -d user`

## Setup autologin
If passwords are removed, the login process can be streamlined by always logging in the default user.

1. `cd /etc/systemd/system/getty.target.wants`
2. `sudo vi getty@tty1.service`
3. Change the line that starts with `ExecStart=-/sbin/agetty`... to `ExecStart=-/sbin/agetty -a USERNAME %I 38400`
4. `reboot now`

## Setup window manager
As already noted, the purpose of this is creating a sort of "development application". As there are a small number of components which have UIs that need to be used (the IDE, a browser and a terminal being the main three), a minimal window manager that supports quick switching between applications, full screen and a variety of shared screen configurations, all with customisable keyboard layouts is desirable. It is also useful to minimise the memory footprint of the virtual machine.

The [i3 window manager](https://i3wm.org/) is flexible, small and easy to configure.
1. `sudo apt install -y i3 xorg`
2. `echo ‘exec i3’ > ~/.xsession` # i3 will be executed when X starts.
3. `vi ~/.bash_profile`
4. Add this to `.bash_profile` # X will start on login.
```
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
fi
```

If VMWare is used:
- `sudo apt install -y open-vm-tools-desktop`

## Steup rust
Install instructions adapted from [here](https://www.rust-lang.org/tools/install).
```
sudo apt install -y curl
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

## Setup vscode
Install instructions adapted from [here](https://code.visualstudio.com/docs/setup/linux).
```
sudo apt install -y wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
sudo apt install -y apt-transport-https
sudo apt update
sudo apt install -y code
```

