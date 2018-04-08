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
alias stripeforward='ultrahook stripe http://172.21.0.3:3000/payment_notifications/stripe'
alias ppmforward='ultrahook ppm http://172.21.0.3:3000/payment_notifications/paypal_marketplace'
alias paypalforward='ultrahook paypal http://172.21.0.3:3000/payment_notifications'
alias vim='nvim'
alias sudo='sudo '
alias flushdns='sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder; echo DNS cache flushed'
alias ctags='/usr/local/Cellar/ctags/5.8_1/bin/ctags'

tic ~/$TERM.ti

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="/usr/local/opt/qt/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$(brew --prefix qt@5.5)/bin:$PATH"
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"
export GPG_TTY=$(tty)

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh

# ulimit -n 65536 65536
