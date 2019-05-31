#!/usr/bin/env bash

git clone --recurse-submodules https://github.com/jethrodaniel/dotfiles /tmp/dotfiles \
  && /tmp/dotfiles/dotfiles -y install \
  && rm -rf /tmp/dotfiles
