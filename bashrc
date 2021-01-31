HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

[ -f /usr/share/doc/git/contrib/completion/git-completion.bash ] && source /usr/share/doc/git/contrib/completion/git-completion.bash
source ~/dotfiles/alias

if [[ $(command -v starship) != "" ]] ; then
    eval $(starship init bash)
else
    source ~/dotfiles/prompt.sh
fi

