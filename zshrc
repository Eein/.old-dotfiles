# Path to your oh-my-zsh installation.
export ZSH=/Users/will/.oh-my-zsh
# RBENV
# Notes:
# According to tpope, if you want to handle the same rb version in
# vim and zsh, do the following. Theres a couple of other fixes as
# well.
# - Move /etc/zshenv to /etc/zshrc.
# - Set your PATH in ~/.zshenv instead of ~/.zshrc.
#eval "$(rbenv init -)"

ZSH_THEME="robbyrussell"

plugins=(git bundler brew git osx ruby rails zsh-syntax-highlighting)

# User configuration
export PATH="$HOME/.rbenv/shims:$HOME/.rbenv/bin:$HOME/.composer/vendor/bin:/Applications/MAMP/bin/php/php5.5.10/bin:/usr/local/Cellar/qt5/5.3.1/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/PostgreSQL/9.4/bin"

source $ZSH/oh-my-zsh.sh

# Custom Aliases
alias clr='clear'

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

alias lotus="noglob lotus"
alias lg="log --oneline --decorate --graph"
