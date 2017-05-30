ZSH_THEME='eein'

export ZSH=~/.oh-my-zsh
export PATH="$HOME/.composer/vendor/bin:$HOME/.rbenv/shims:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/.composer/vendor/bin"
export PATH="$(yarn global bin):$PATH"
export EDITOR='nvim'
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

source $ZSH/oh-my-zsh.sh
source ~/.api # Source API keys

# Custom Aliases
alias vim='nvim'
alias sudo='sudo '
alias flushdns='sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder; echo DNS cache flushed'

tic ~/$TERM.ti
