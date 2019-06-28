ZSH_THEME='eein'

export ZSH=~/.oh-my-zsh
export PATH="$HOME/bin:$HOME/.local/bin:$HOME/.cargo/bin:$HOME/.rbenv/shims:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/Library/Python/2.7/bin"
export EDITOR='nvim'

# Source API keys
if [ -f $HOME/.api ]; then
  source ~/.api
fi
if [ -f $HOME/.keys ]; then
  source ~/.keys
fi

# Custom Aliases
alias stripeforward='ultrahook stripe http://tiltifydev.com:3000/payment_notifications/stripe'
alias ppmforward='ssh -R 80:tiltifydev.com:3000 serveo.net'
alias paypalforward='ultrahook paypal http://172.21.0.3:3000/payment_notifications'
alias vim='nvim'
alias sudo='sudo '

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(fnm env --multi)"

case `uname` in
  Darwin)
    # commands for OS X go here
    alias flushdns='sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder; echo DNS cache flushed'
    export PATH="$(yarn global bin):$PATH"
    export EMACS="*term*"
  ;;
  Linux)
    # commands for Linux go here
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"
  ;;
esac

