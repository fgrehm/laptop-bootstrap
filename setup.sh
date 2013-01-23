#!/bin/bash

if ! [ -d $HOME/.ssh ]; then
  echo "You forgot to restore your SSH key ;)"
  exit 1
fi

cd setup

./cleanup
./add-repositories
./packages
./dotfiles
./rubies
./configs
./notify-osd
./vagrant
./node
./phantomjs
./git
./heroku

# Add my user to vboxusers group so that USB devices work properly on VirtualBox
usermod -a -G vboxusers fabio
