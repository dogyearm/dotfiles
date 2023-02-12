#!/bin/sh

if ! type brew >/dev/null 2>&1
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

