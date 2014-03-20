#!/bin/bash

wget https://github.com/jingweno/gh/releases/download/v2.0.0/gh_2.0.0_amd64.deb \
  -O /tmp/gh.deb

sudo dpkg -i /tmp/gh.deb
