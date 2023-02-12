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
    ~/.zsh/plugins/zsh-completions(N-/) \
    /usr/local/share/zsh/site-functions(N-/) \
    $fpath \
)

cdpath=(
  $HOME/(N-/)
  $HOME/src/github.com/dogyearm(N-/)
  $cdpath
)

