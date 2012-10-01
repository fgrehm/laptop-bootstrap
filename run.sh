#!/bin/bash

if ! [ -d $HOME/.ssh ]; then
  echo "You forgot to restore your SSH key ;)"
  exit 1
fi

./scripts/cleanup
./scripts/add-repositories
./scripts/packages
./scripts/dotfiles
./scripts/rubies
./scripts/configs
