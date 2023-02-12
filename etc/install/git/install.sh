#!/bin/sh

# Install Zsh
if ! [ -x /usr/local/bin/zsh ] >/dev/null 2>&1
then
    brew install zsh
fi

