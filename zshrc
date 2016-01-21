# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(git bundler brew git osx ruby rails zsh-syntax-highlighting)

# User configuration
export PATH="$HOME/.rbenv/shims:$HOME/.rbenv/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# Swapping from PHP 5.5 to PHP 5.6
# export PATH="$(brew --prefix homebrew/php/php55)/bin:$PATH"
# export ANDROID_HOME=/usr/local/opt/android-sdk

source $ZSH/oh-my-zsh.sh

# Custom Aliases
alias clr='clear'
alias lotus="noglob lotus"
alias lg="log --oneline --decorate --graph"
alias rs="rails server -b $(ifconfig | grep -o '\s192.168.[0-9]\{1,3\}.[0-9]\{1,3\}\s')"
alias dumpsterswap="rm -i `find . | grep .swp$`"
alias vim='nvim'
alias tmux='TERM=screen-256color-bce tmux'

# eval "$(docker-machine env default)"
