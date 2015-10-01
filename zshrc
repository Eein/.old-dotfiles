# Path to your oh-my-zsh installation.
export ZSH=/Users/will/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(git bundler brew git osx ruby rails zsh-syntax-highlighting)

# User configuration
export PATH="$HOME/.rbenv/shims:$HOME/.rbenv/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

source $ZSH/oh-my-zsh.sh

# Custom Aliases
alias clr='clear'
alias lotus="noglob lotus"
alias lg="log --oneline --decorate --graph"
