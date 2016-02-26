# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

ZSH_THEME="robbyrussell"

# plugins=(nope)

# User configuration
export PATH="$HOME/.rbenv/shims:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/.composer/vendor/bin"

source $ZSH/oh-my-zsh.sh

# Custom Aliases
alias vim='nvim'

function rs {
  rails server -b $(ifconfig | grep -o '\s192.168.[0-9]\{1,3\}.[0-9]\{1,3\}\s')
}

alias flushdns='sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder; echo DNS cache flushed'

eval "$(docker-machine env default)"
