#!/bin/zsh

# <user@host if ssh>:<pwd> <git branch if git repo> %\n

function get_git_symbol_color {
    if [[ -z $(git status --porcelain) ]]; then
        echo '%F{green}' && return
    else
        echo '%F{red}' && return
    fi
}

function prompt_char {
    git branch >/dev/null 2>/dev/null && echo "$(get_git_symbol_color)±%f" && return
    hg root >/dev/null 2>/dev/null && echo '☿' && return
}

function hg_prompt_info_nocolor {
    hg branch 2> /dev/null
}

function git_prompt_simple {
    git symbolic-ref --short HEAD 2> /dev/null || git rev-parse --short HEAD 2> /dev/null
}

function create_repo_prompt {
    repo_char="$(prompt_char)"
    hg_prompt="$(hg_prompt_info_nocolor)"
    git_prompt="$(git_prompt_simple)"
    echo "${repo_char} <${hg_prompt}${git_prompt}>"
}

function get_pwd() {
    echo "${PWD/$HOME/~}"
}

function get_remote() {
    if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
        remote="%F{yellow}%B%n@%m%b%f"
    fi
}

working_dir="$(get_pwd)"
repo_prompt="$(create_repo_prompt)"

#PROMPT='[${remote} %F{magenta}%B$(get_pwd)%b%f ] $(create_repo_prompt)
# %F{cyan}%#%f ;

PROMPT='┏[$(get_remote) %F{magenta}%B$(get_pwd)%b%f ] $(create_repo_prompt)
┗%(?.%F{cyan}-%f.%F{red}●%f)%F{cyan}%#%f '

setopt promptsubst
