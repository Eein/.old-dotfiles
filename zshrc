ZSH_THEME='eein'

export ZSH=~/.oh-my-zsh
export PATH="$HOME/.composer/vendor/bin:$HOME/.rbenv/shims:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export EDITOR='nvim'

source $ZSH/oh-my-zsh.sh
source ~/.api # Source API keys

# Custom Aliases
alias stripeforward='ultrahook stripe http://172.21.0.3:3000/payment_notifications/stripe'
alias ppmforward='ssh -R 80:172.20.0.2:3000 serveo.net'
alias paypalforward='ultrahook paypal http://172.21.0.3:3000/payment_notifications'
alias vim='nvim'
alias sudo='sudo '

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="/usr/local/opt/qt/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"
export GPG_TTY=$(tty)

case `uname` in
  Darwin)
    # commands for OS X go here
    alias flushdns='sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder; echo DNS cache flushed'
    export PATH="$(yarn global bin):$PATH"
    export PATH="$(brew --prefix qt@5.5)/bin:$PATH"
  ;;
  Linux)
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"
    # commands for Linux go here
  ;;
esac

# ulimit -n 65536 65536

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
