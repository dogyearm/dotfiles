#!/bin/sh

DOT_DIRECTORY="${HOME}/src/github.com/dogyearm/dotfiles"
DOT_TARBALL="https://github.com/dogyearm/dotfiles/tarball/master"
GIT_URL="https://github.com/dogyearm/dotfiles"

if [ ! -d ${DOT_DIRECTORY} ];then
    echo 'Downloading dotfiles...'
    mkdir ${DOT_DIRECTORY}

    if type "git" > /dev/null 2>&1; then
        git clone --recursive "${GIT_URL}" "${DOT_DIRECTORY}"
    else
        curl -fsSLo ${HOME}/dotfiles.tar.gz ${DOT_TARBALL}
        tar -zxf ${HOME}/dotfiles.tar.gz --strip-components 1 -C ${DOT_DIRECTORY}
        rm -f ${HOME}/dotfiles.tar.gz
    fi

    echo "Download finished."
fi

${DOT_DIRECTORY}/etc/install/homebrew/install.sh
${DOT_DIRECTORY}/etc/install/zsh/install.sh
${DOT_DIRECTORY}/etc/install/git/install.sh
${DOT_DIRECTORY}/etc/install/tmux/install.sh
${DOT_DIRECTORY}/etc/install/fzf/install.sh
${DOT_DIRECTORY}/etc/install/ripgrep/install.sh
${DOT_DIRECTORY}/etc/link.sh
