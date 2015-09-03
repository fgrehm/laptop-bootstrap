#!/bin/bash

if ! [ -d $HOME/.ssh ]; then
  echo "You forgot to restore your SSH key ;)"
  exit 1
fi

cd setup

./cleanup
./add-repositories
./lxc
./packages
./dotfiles
./configs
./vagrant
./docker
./gh
./git-extras
./heroku

# Based on https://help.ubuntu.com/community/AndroidSDK#Preparing_Hardware
cat <<STR | sudo tee /etc/udev/rules.d/51-android.rules
SUBSYSTEM=="usb", ATTRS{idVendor}=="0bb4", MODE="0666"
SUBSYSTEM=="usb", ATTRS{idVendor}=="0502", MODE="0666"
SUBSYSTEM=="usb", ATTRS{idVendor}=="12d1", MODE="0666"
SUBSYSTEM=="usb", ATTRS{idVendor}=="1004", MODE="0666"
SUBSYSTEM=="usb", ATTRS{idVendor}=="22b8", MODE="0666"
SUBSYSTEM=="usb", ATTRS{idVendor}=="04e8", MODE="0666"
SUBSYSTEM=="usb", ATTRS{idVendor}=="0fce", MODE="0666"
SUBSYSTEM=="usb", ATTRS{idVendor}=="0489", MODE="0666"
SUBSYSTEM=="usb", ATTRS{idVendor}=="18d1", SYMLINK+="android_adb", MODE="0666"
SUBSYSTEM=="usb", ATTRS{idVendor}=="04e8", MODE="0666", GROUP="plugdev"
STR

# Add my user to vboxusers group so that USB devices work properly on VirtualBox
sudo groupadd vboxusers
sudo usermod -a -G vboxusers fabio
