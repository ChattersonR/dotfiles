#!/bin/zsh

# <user@host if ssh>:<pwd> <git branch if git repo> %\n

source git-prompt.sh

function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    hg root >/dev/null 2>/dev/null && echo '☿' && return
    echo '○'
}

function hg_prompt_info_nocolor {
    hg branch 2> /dev/null
}

function git_prompt_simple {
    git branch 2> /dev/null
}

function create_repo_prompt {
    #"$(prompt_char)$(hg_prompt_info_nocolor)$(__git_ps1 " (%s)")"
    echo "$(hg_prompt_info_nocolor)$(git_prompt_simple)"
    
}

function get_pwd() {
    echo "${PWD/$HOME/~}"
}

if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
    remote=" %F{yellow}%B%n@%m%b%f"
fi


PROMPT="[${remote} %F{magenta}%B$(get_pwd)%b%f ] $create_repo_prompt
 %F{cyan}%#%f "

unset host
unset color_prompt force_color_prompt
