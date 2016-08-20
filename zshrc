# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

ZSH_THEME='gozilla'

# plugins=(nope)

# User configuration
export PATH="$HOME/.rbenv/shims:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/.composer/vendor/bin"

source $ZSH/oh-my-zsh.sh

export EDITOR='nvim'

# Custom Aliases
alias vim='nvim'
alias sudo='sudo '

function rs {
  rails server -b $(ifconfig | grep -o '\s192.168.1\{1,3\}.[0-9]\{1,3\}\s')
}

alias flushdns='sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder; echo DNS cache flushed'

# Fix backspace in nvim
infocmp $TERM | sed 's/kbs=^[hH]/kbs=\\177/' > ~/$TERM.ti
tic ~/$TERM.ti

# Source API keys
source ~/.api
