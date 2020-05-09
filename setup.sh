#!/bin/bash

if ! [ -d $HOME/.ssh ]; then
  echo "You forgot to restore your SSH key ;)"
  exit 1
fi

cd setup

./cleanup
./packages
./dropbox
./dotfiles
# ./lxc
./docker
./heroku
