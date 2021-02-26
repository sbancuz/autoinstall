#!/usr/bin/env bash
# Created by Liam Powell (gfelipe099)
# A compilation of all the files from ArchMatic's repository

#-------------------------------------------------------------------------
#      _          _    __  __      _   _
#     /_\  _ _ __| |_ |  \/  |__ _| |_(_)__
#    / _ \| '_/ _| ' \| |\/| / _` |  _| / _|
#   /_/ \_\_| \__|_||_|_|  |_\__,_|\__|_\__|
#  Arch Linux Post Install Setup and Config
#-------------------------------------------------------------------------

echo "-------------------------------------------------"
echo "              makepkg configuration              "
echo "-------------------------------------------------"
nc=$(grep -c ^processor /proc/cpuinfo)
echo "You have "$nc" cores."
echo "-------------------------------------------------"
echo "Changing the makeflags for "$nc" cores."
sudo sed -i 's/#MAKEFLAGS="-j2"/MAKEFLAGS="-j$nc"/g' /etc/makepkg.conf
echo "Changing the compression settings for "$nc" cores."
sudo sed -i 's/COMPRESSXZ=(xz -c -z -)/COMPRESSXZ=(xz -c -T $nc -z -)/g' /etc/makepkg.conf

# Installing paru
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si

PKGS=(

    # --- XORG Display Rendering ----------------------------------------------

        'xorg'                  # Base Package
        'xorg-drivers'          # Display Drivers 
        'xterm'                 # Terminal for TTY
        'xorg-server'           # XOrg server
        'xorg-apps'             # XOrg apps group
        'xorg-xinit'            # XOrg init
        'xorg-xinput'           # Xorg xinput
        'mesa'                  # Open source version of OpenGL

    # --- Setup Desktop -------------------------------------------------------

        'awesome'               # Awesome Desktop
        'xfce4-power-manager'   # Power Manager 
        'rofi'                  # Menu System
        'picom'                 # Translucent Windows
        'xclip'                 # System Clipboard
        'gnome-polkit'          # Elevate Applications
        'lxappearance'          # Set System Themes

    # --- Login Display Manager -----------------------------------------------

        'lightdm'                   # Base Login Manager
        'lightdm-webkit2-greeter'   # Framework for Awesome Login Themes

    # --- Networking Setup ----------------------------------------------------

        'wpa_supplicant'            # Key negotiation for WPA wireless networks
        'dialog'                    # Enables shell scripts to trigger dialog boxes
        'openvpn'                   # Open VPN support
        'networkmanager-openvpn'    # Open VPN plugin for NM
        'network-manager-applet'    # System tray icon/utility for network connectivity
        'libsecret'                 # Library for storing passwords
    
    # --- Audio ---------------------------------------------------------------

        'audacity'          # Music player
        'audacius'          # Mudic editor
        'alsa-utils'        # Advanced Linux Sound Architecture (ALSA) Components https://alsa.opensrc.org/
        'alsa-plugins'      # ALSA plugins
        'pulseaudio'        # Pulse Audio sound components
        'pulseaudio-equalizer'
        'pulseaudio-alsa'   # ALSA configuration for pulse audio
        'pavucontrol'       # Pulse Audio volume control
        'pnmixer'           # System tray volume control

    # --- Bluetooth -----------------------------------------------------------

        'bluez'                 # Daemons for the bluetooth protocol stacktranslation
        'bluez-utils'           # Bluetooth development and debugging utilities
        'bluez-firmware'        # Firmwares for Broadcom BCM203x and STLC2300 Bluetooth chips
        'blueberry'             # Bluetooth configuration tool
        'pulseaudio-bluetooth'  # Bluetooth support for PulseAudio
    
    # --- Printers ------------------------------------------------------------

        'cups'                  # Open source printer drivers
        'cups-pdf'              # PDF support for cups
        'ghostscript'           # PostScript interpreter
        'gsfonts'               # Adobe Postscript replacement fonts
        'hplip'                 # HP Drivers
        'system-config-printer' # Printer setup  utility

    # --- SERVERS -------------------------------------------------------------
        
        'apache'
        'nginx'
        'openssh'
        'squid'
        'samba'
        'dhcpcd'
        'vsftpd'

    # --- TERMINAL UTILITIES --------------------------------------------------

        'bleachbit'             # File deletion utility
        'cronie'                # cron jobs
        'curl'                  # Remote content retrieval
        'file-roller'           # Archive utility
        'gtop'                  # System monitoring via terminal
        'gufw'                  # Firewall manager
        'hardinfo'              # Hardware info app
        'htop'                  # Process viewer
        'neofetch'              # Shows system info when you launch terminal
        'ntp'                   # Network Time Protocol to set time via network.
        'numlockx'              # Turns on numlock in X11
        'openssh'               # SSH connectivity tools
        'p7zip'                 # 7z compression program
        'rsync'                 # Remote file sync utility
        'speedtest-cli'         # Internet speed via terminal
        'tlp'                   # Advanced laptop power management
        'unrar'                 # RAR compression program
        'unzip'                 # Zip compression program
        'wget'                  # Remote content retrieval
        'termite'               # Terminal emulator
        'zenity'                # Display graphical dialog boxes via shell scripts
        'zip'                   # Zip compression program
        'zsh'                   # ZSH shell
        'zsh-completions'       # Tab completion for ZSH
        'neovim'

    # --- DISK UTILITIES ------------------------------------------------------

        'android-tools'         # ADB for Android
        'android-file-transfer' # Android File Transfer
        'autofs'                # Auto-mounter
        'btrfs-progs'           # BTRFS Support
        'dosfstools'            # DOS Support
        'exfat-utils'           # Mount exFat drives
        'gparted'               # Disk utility
        'gvfs-mtp'              # Read MTP Connected Systems
        'gvfs-smb'              # More File System Stuff
        'nemo-fileroller'       # Nemo extension
        'nemo-preview'
        'nemo-seahorse'
        'nemo-share'
        'nemo-terminal'
        'ntfs-3g'               # Open source implementation of NTFS file system
        'parted'                # Disk utility
        'samba'                 # Samba File Sharing
        'smartmontools'         # Disk Monitoring
        'smbclient'             # SMB Connection 
        'xfsprogs'              # XFS Support

    # GENERAL UTILITIES ---------------------------------------------------

        'flameshot'             # Screenshots
        'freerdp'               # RDP Connections
        'libvncserver'          # VNC Connections
        'nemo'                  # Filesystem browser
        'remmina'               # Remote Connection
        'veracrypt'             # Disc encryption utility
        'nitrogen'              # Wallpaper changer
        'firefox'               # Web browser
        'jdownloader2'
        'stow'

    # DEVELOPMENT ---------------------------------------------------------
    
        'gedit'                 # Text editor
        'clang'                 # C Lang compiler
        'cmake'                 # Cross-platform open-source make system
        'visual-studio-code-bin'# Visual Studio Code
        'electron'              # Cross-platform development using Javascript
        'git'                   # Version control system
        'gcc'                   # C/C++ compiler
        'glibc'                 # C libraries
        'meld'                  # File/directory comparison
        'nodejs'                # Javascript runtime environment
        'npm'                   # Node package manager
        'python'                # Scripting language
        'yarn'                  # Dependency management (Hyper needs this)
        'mariadb'
        'phpmyadmin'
        'redis'
        'java-runtime-common'
        'jdk8-openjdk'
        'jdk11-openjdk'
        'perl'
        'php'
        'ruby'
        'go'
        'go-tools'

    # MEDIA ---------------------------------------------------------------

        'kdenlive'              # Movie Render
        'celluloid'             # Video player
        'spotify'
        
    # GRAPHICS AND DESIGN -------------------------------------------------

        'gcolor2'               # Colorpicker
        'gimp'                  # GNU Image Manipulation Program
        'ristretto'             # Multi image viewer

    # PRODUCTIVITY --------------------------------------------------------

        'hunspell'              # Spellcheck libraries
        'hunspell-en_GB'        # English spellcheck library
        'hunspell-it'
        'xpdf'                  # PDF viewer
    
    # SECURITY -----------------------------------------------------------

        'ufw'                   # Firewall
        'fail2ban'              # Bans IP adresses      
    
    # UTILITIES -----------------------------------------------------------

        'balena-etcher'         # Bootable Usb patcher
        'onedrive-abraunegg'    # Onedrive service        
        'gtkhash'              # Checksum calculator
        'light-git'             # Brightness controller
        'redshift'              # Redshift

    # COMMUNICATIONS ------------------------------------------------------

        'lightcord-bin'         # Discord client
    
    # GAMES ---------------------------------------------------------------
        
        'steam'                 # Game client
        'lutris'                # Game client
        'pokemmo'
        'multimc5'
        'steam-native-runtime'
        'ttf-liberation'

    # THEMES --------------------------------------------------------------

        'lightdm-webkit-theme-aether'   # Lightdm Login Theme - https://github.com/NoiSek/Aether#installation
        'materia-gtk-theme'             # Desktop Theme
        'papirus-icon-theme'            # Desktop Icons
        'nerd-fonts-mononoki'

)

for PKG in "${PKGS[@]}"; do
    paru -S "$PKG" --noconfirm --needed
done




# Generate the .xinitrc file so we can launch Awesome from the
# terminal using the "startx" command
# printf '#!/bin/bash
# # Disable bell
# xset -b
# 
# # Disable all Power Saving Stuff
# xset -dpms
# xset s off
# 
# # X Root window color
# xsetroot -solid darkgrey
# 
# # Merge resources (optional)
# #xrdb -merge $HOME/.Xresources
# 
# # Caps to Ctrl, no caps
# setxkbmap -layout us -option ctrl:nocaps
# if [ -d /etc/X11/xinit/xinitrc.d ] ; then
# for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
#     [ -x "\$f" ] && . "\$f"
# done
# unset f
# fi' > ${HOME}/.xinitrc

# ------------------------------------------------------------------------

echo
echo "Updating /bin/startx to use the correct path"

# By default, startx incorrectly looks for the .serverauth file in our HOME folder.
sudo sed -i 's|xserverauthfile=\$HOME/.serverauth.\$\$|xserverauthfile=\$XAUTHORITY|g' /bin/startx

# ------------------------------------------------------------------------

echo
echo "Disabling buggy cursor inheritance"

# When you boot with multiple monitors the cursor can look huge. This fixes it.
printf '[Icon Theme]
#Inherits=Theme' > /usr/share/icons/default/index.theme

# ------------------------------------------------------------------------

echo
echo "Increasing file watcher count"

# This prevents a "too many files" error in Visual Studio Code
echo fs.inotify.max_user_watches=524288 | sudo tee /etc/sysctl.d/40-max-user-watches.conf && sudo sysctl --system

# ------------------------------------------------------------------------

echo
echo "Disabling Pulse .esd_auth module"

# Pulse audio loads the `esound-protocol` module, which best I can tell is rarely needed.
# That module creates a file called `.esd_auth` in the home directory which I'd prefer to not be there. So...
sudo sed -i 's|load-module module-esound-protocol-unix|#load-module module-esound-protocol-unix|g' /etc/pulse/default.pa

# ------------------------------------------------------------------------

echo
echo "Enabling Login Display Manager"

sudo systemctl enable --now lightdm.service
sudo sed 's/^#logind-check-graphical=false/logind-check-graphical=true/g' /etc/lightdm/lightdm.conf 

# ------------------------------------------------------------------------

echo
echo "Enabling bluetooth daemon and setting it to auto-start"

sudo sed -i 's|#AutoEnable=false|AutoEnable=true|g' /etc/bluetooth/main.conf
sudo systemctl enable --now bluetooth.service

# ------------------------------------------------------------------------

echo
echo "Enabling the cups service daemon so we can print"

systemctl enable --now org.cups.cupsd.service

echo "Configuring NTP, DHCP, SSH and NetworkManager services"
sudo ntpd -qg && sudo systemctl enable --now ntpd && sudo systemctl disable dhcpcd && sudo systemctl stop dhcpcd && sudo systemctl enable --now NetworkManager && sudo systemctl enable sshd

# Remove no password sudo rights
sed -i 's/^%wheel ALL=(ALL) NOPASSWD: ALL/# %wheel ALL=(ALL) NOPASSWD: ALL/' /etc/sudoers
# Add sudo rights
sed -i 's/^# %wheel ALL=(ALL) ALL/%wheel ALL=(ALL) ALL/' /etc/sudoers


echo
echo "Getting dotfiles"

cd $HOME
git clone https://github.com/lbanca01/.dotfiles && cd ./dotfiles && stow *

# Clean orphans pkg
if [[ ! -n $(paru -Qdt) ]]; then
    echo "No orphans to remove."
else
    paru -Rns $(paru -Qdtq)
fi

# Replace in the same state
cd $pwd

echo -n "\n\n\nArchMatic finished the installation and configuration of the system!\n\n\n"
