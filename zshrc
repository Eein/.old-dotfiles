ZSH_THEME='eein'

export ZSH=~/.oh-my-zsh
export PATH="$HOME/.composer/vendor/bin:$HOME/.rbenv/shims:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export EDITOR='nvim'

source $ZSH/oh-my-zsh.sh

if [ -f $HOME/.api ]; then
  source ~/.api # Source API keys
fi

if [ -f $HOME/.keys ]; then
  source ~/.keys # Source keys
fi

# Custom Aliases
alias stripeforward='ultrahook stripe http://tiltifydev.com:3000/payment_notifications/stripe'
alias ppmforward='ssh -R 80:172.20.0.2:3000 serveo.net'
alias paypalforward='ultrahook paypal http://172.21.0.3:3000/payment_notifications'
alias rmswap='find . -type f -name "*.swp" -exec rm -f {} \;'
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
  ;;
  Linux)
    # commands for Linux go here
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"
  ;;
esac

# ulimit -n 65536 65536
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
