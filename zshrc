ZSH_THEME='eein'

export ZSH=~/.oh-my-zsh
export PATH="$HOME/.composer/vendor/bin:$HOME/.rbenv/shims:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/.composer/vendor/bin"
export PATH="$(yarn global bin):$PATH"
export EDITOR='nvim'
# export NVM_DIR="$HOME/.nvm"
# . "/usr/local/opt/nvm/nvm.sh"

source $ZSH/oh-my-zsh.sh
source ~/.api # Source API keys

# Custom Aliases
alias stripeforward='ultrahook stripe http://localhost:3000/payment_notifications/stripe'
alias paypalforward='ultrahook paypal http://localhost:3000/payment_notifications'
alias vim='nvim'
alias sudo='sudo '
alias flushdns='sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder; echo DNS cache flushed'
alias ctags='/usr/local/Cellar/ctags/5.8_1/bin/ctags'

tic ~/$TERM.ti

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="/usr/local/opt/qt/bin:$PATH"
