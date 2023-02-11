# cd & ls
function _cd_ls() {
    ls
}

autoload -Uz add-zsh-hook
add-zsh-hook chpwd _cd_ls
