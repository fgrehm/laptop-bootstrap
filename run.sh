#!/bin/bash

# TODO: Check if ssh keys are present

sudo apt-get remove thunderbird*

sudo apt-get install --yes --force-yes python-software-properties

# apt-add-repository?

echo "deb http://download.virtualbox.org/virtualbox/debian $(lsb_release -sc) contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list
wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add -

echo "deb http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list
wget -q https://dl-ssl.google.com/linux/linux_signing_key.pub -O- | sudo apt-key add -

echo "deb http://linux.dropbox.com/ubuntu $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/dropbox.list
sudo apt-key adv --keyserver pgp.mit.edu --recv-keys 5044912E

sudo add-apt-repository "deb http://archive.canonical.com/ $(lsb_release -sc) partner"

sudo add-apt-repository -y ppa:scopes-packagers/ppa
sudo add-apt-repository -y ppa:leolik/leolik
sudo add-apt-repository -y ppa:nilarimogard/webupd8

sudo apt-get update
sudo apt-get dist-upgrade

sudo apt-get update && sudo apt-get install --yes --force-yes \
  virtualbox-4.2 \
  google-chrome-stable \
  dropbox \
  skype \
  notifyosdconfig \
  unity-lens-utilities unity-scope-calculator unity-scope-cities \
  git-core gitg \
  curl tree \
  vim-nox vim-gnome \
  icedtea-plugin \
  sqlite3 libsqlite3-dev \
  ubuntu-restricted-extras \
  zlib1g-dev openssl libssl-dev libruby1.9.1 libreadline-dev build-essential libncurses5-dev libxslt1-dev libxml2-dev libffi-dev \
  libxine1-ffmpeg gxine mencoder totem-mozilla icedax tagtool easytag id3tool lame nautilus-script-audio-convert libmad0 mpg321

###############################################################################
# Vim && dotfiles

mkdir -p ~/projetos/oss
pushd ~/projetos/oss
  git clone git@github.com:fgrehm/dotfiles.git && cd dotfiles && ./setup.sh && cd ..
  git clone git@github.com:fgrehm/vimfiles.git && cd vimfiles && ./setup.sh
popd

mkdir -p ~/.fonts
git clone https://github.com/scotu/ubuntu-mono-powerline.git ~/.fonts

###############################################################################
# Rubies

git clone git://github.com/sstephenson/rbenv.git ~/.rbenv
mkdir -p ~/.rbenv/plugins
pushd ~/.rbenv/plugins
  git clone git://github.com/sstephenson/ruby-build.git
  git clone git://github.com/chriseppstein/rbenv-each.git
  git clone git@github.com:fgrehm/rbenv-install-remote.git
  git clone git://github.com/sstephenson/rbenv-vars.git
popd

rbenv install 1.9.3-p194 && rbenv global 1.9.3-p194
rbenv install https://raw.github.com/gist/3345650/ree-1.8.7-2011.03
rbenv install https://raw.github.com/gist/3345650/ree-1.8.7-2012.02

rbenv rehash

rbenv each -v gem install rubygems-bundler bundler
rbenv each -v gem regenerate_binstubs


###############################################################################

# Show status bar on nautilus
gsettings set org.gnome.nautilus.window-state start-with-status-bar true

# Auto hide launcher
gsettings set com.canonical.Unity2d.Launcher hide-mode 1



###############################################################################
# Configurar OSD baseado em: ~/.notify-osd

