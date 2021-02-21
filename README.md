# Robert Chattersons Dotfiles and Configurations.

### Requirements
GNU Stow

This uses GNU-Stow to manage dotfile configurations in the home directory.

1. Clone to ${HOME}
2. cd ${HOME}/dotfiles
3. stow <package>

### Packages
| Package | Description |
| - | - |
| base | Shared shell configurations. |
| bash | Bash shell configuration. |
| fish | fish shell configuration. |
| fonts | Nerd Fonts that I like |
| git | Git configuration. |
| tmux | tmux configuration. |
| vim | vim configuration. |
| zsh | zsh shell configuration. |

### Limitations
1. Does not support different network (proxy) setups.

### Install Fonts
`stow fonts`
`fc-cache -fv`

### Setup of pass
1. Clone password store to `~/.password-store`
1. import secret gpg key into gpg-keyring. `gpg --import private.key`
2. List gpg keys. `gpg --list-secret-keys`
3. `pass init <some potion of uid from gpg key>`
