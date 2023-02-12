#!/bin/sh

DOT_DIRECTORY="$(pwd)"

for f in .??*
do
    [[ ${f} = ".git" ]] && continue
    [[ ${f} = ".gitignore" ]] && continue
    [[ ${f} = ".DS_Store" ]] && continue
    ln -snfv ${DOT_DIRECTORY}/${f} ${HOME}/${f}
done
echo 'Deploy dotfiles completed.'
