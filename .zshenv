typeset -gx -U path
path=( \
    ~/bin(N-/) \
    "$path[@]" \
)

# NOTE: set fpath before compinit
typeset -gx -U fpath
fpath=( \
    ~/.zsh/completion(N-/) \
    ~/.zsh/functions(N-/) \
    /usr/local/share/zsh/site-functions(N-/) \
    $fpath \
)

cdpath=(
  $HOME/(N-/)
  $HOME/src/github.com/dogyearm(N-/)
  $cdpath
)

export GOROOT=/usr/local/go
export GOPATH=$HOME/src
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# Rails
# export LIBRARY_PATH=$LIBRARY_PATH:$(brew --prefix zstd)/lib/

# Tmux
export TMUX_TMPDIR=$HOME/.tmux
mkdir -p $TMUX_TMPDIR
