#!/bin/sh

# Install Git
if ! type git >/dev/null 2>&1
then
    brew install git
fi

