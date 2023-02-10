#!/bin/zsh
git pull && git fetch --tags --prune && git branch --merged=$(git bn) | grep -vE 'develop|master|$(git bn)' | xargs git branch -d
