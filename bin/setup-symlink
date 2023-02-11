#!/bin/bash

# Symlink
dotfiles=(.zprofile .zshrc .zshenv .zsh .vimrc .tmux.conf .gitconfig .gitignore .bin)

for file in "${dotfiles[@]}"; do
  sourceFile="$(pwd)/$file"
  targetFile="$HOME/$file"
  ln -snfv $sourceFile $targetFile
done
