## Zsh
#export SHELL='zsh'
#
## Editor
#export EDITOR='vim'
#export CVSEDITOR="${EDITOR}"
#export SVN_EDITOR="${EDITOR}"
#export GIT_EDITOR="${EDITOR}"
#
## Add ~/bin to PATH
##export PATH=~/bin:"$PATH"
##
## Settings for golang
#export GOPATH="$HOME"
#export GOBIN="$GOPATH/bin"
#export PATH="$GOBIN:$PATH"
#
## History file
#export HISTFILE=~/.zsh_history
## History size in memory
#export HISTSIZE=10000
## The number of histsize
#export SAVEHIST=1000000
## The size of asking history
#export LISTMAX=50
## Do not add in root
#if [ $UID = 0 ]; then
#    unset HISTFILE
#    export SAVEHIST=0
#fi
