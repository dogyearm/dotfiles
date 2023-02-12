#!/bin/sh

# Install ripgrep
# https://github.com/BurntSushi/ripgrep#installation
if ! [ -x /usr/local/bin/rg ] >/dev/null 2>&1
then
  brew install ripgrep
fi
