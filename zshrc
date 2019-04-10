zstyle ':completion:*' auto-description 'Specify: %d'
zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' original false
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
#zstyle ':completion:*:*:git:*' script /usr/share/doc/git-1.8.3.1/contrib/completion/git-completion.zsh
zstyle :compinstall filename '/home/badger/.zshrc'

#fpath=(~/.zsh/functions $fpath)

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob nomatch
unsetopt beep notify
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/rchatterson/.zshrc'

autoload -Uz compinit && compinit
autoload -U colors && colors

# End of lines added by compinstall

#source /usr/share/doc/git-1.8.3.1/contrib/completion/git-completion.bash
source ~/dotfiles/alias

source ~/dotfiles/prompt.zsh
