# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

ZSH_THEME="robbyrussell"

# plugins=(nope)

# User configuration
export PATH="$HOME/.rbenv/shims:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/.composer/vendor/bin"
# Swapping from PHP 5.5 to PHP 5.6
# export PATH="$(brew --prefix homebrew/php/php55)/bin:$PATH"
# export ANDROID_HOME=/usr/local/opt/android-sdk

source $ZSH/oh-my-zsh.sh

# Custom Aliases
alias clr='clear'
alias lotus="noglob lotus"
alias lg="log --oneline --decorate --graph"
alias vim='nvim'
alias flushdns='sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder;say flushed '


function rs {
  rails server -b $(ifconfig | grep -o '\s192.168.[0-9]\{1,3\}.[0-9]\{1,3\}\s')
}


# eval "$(docker-machine env default)"
