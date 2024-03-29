#!/bin/sh

# Install Zsh
if ! type zsh >/dev/null 2>&1
then
    brew install zsh
fi

# Install zsh plugin manager
if ! type zplug >/dev/null 2>&1
then
  export ZPLUG_HOME=~/.zplug
  git clone https://github.com/zplug/zplug $ZPLUG_HOME
fi
