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
./hk

# Add my user to vboxusers group so that USB devices work properly on VirtualBox
sudo groupadd vboxusers
sudo usermod -a -G vboxusers fabio
