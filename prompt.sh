#!/bin/bash

# <user@host if ssh>:<pwd> <git branch if git repo> %\n

function get_git_symbol_color {
    if [[ -z $(git status --porcelain) ]]; then
        echo '\e[0;32m' && return
    else
        echo '\e[0;31m' && return
    fi
}

function prompt_char {
    #git branch >/dev/null 2>/dev/null && echo "$(get_git_symbol_color)±\e[m" && return
    git branch >/dev/null 2>/dev/null && echo '±' && return
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

    repo_prompt="${hg_prompt}${git_prompt}"
    if [ -n "${repo_prompt}" ]; then
        repo_prompt="<${repo_prompt}>"
    fi

    echo "${repo_char} ${repo_prompt}"
}

function get_pwd() {
    echo "${PWD/$HOME/~}"
}

function get_remote() {
    if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
        remote="\e[0;33m\u@\H\e[m"
    fi
}

function exitstatus() {
    if [[ $? == 0 ]]; then
        echo '\e[1;36m-\e[m'
    else
        echo '\e[1;31m●\e[m'
    fi
}
working_dir="$(get_pwd)"
repo_prompt="$(create_repo_prompt)"

PS1='┏[$(get_remote) \e[1;35m$(get_pwd)\e[m ] $(create_repo_prompt)
┗${exitstatus}\e[0;36m%#\e[m '
