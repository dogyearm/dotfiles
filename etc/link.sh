#!/bin/bash

# Symlink
# NOTE: change all dotfiles links
dotfiles=(.zprofile .zshrc .zshenv .zsh .vim .vimrc .tmux.conf .gitconfig .gitignore .bin)

for file in "${dotfiles[@]}"; do
  sourceFile="$(pwd)/$file"
  targetFile="$HOME/$file"
  ln -snfv $sourceFile $targetFile
done
