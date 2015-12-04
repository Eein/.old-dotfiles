# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(git bundler brew git osx ruby rails zsh-syntax-highlighting)

# User configuration
export PATH="$HOME/.rbenv/shims:$HOME/.rbenv/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# Swapping from PHP 5.5 to PHP 5.6
# export PATH="$(brew --prefix homebrew/php/php55)/bin:$PATH"
# export ANDROID_HOME=/usr/local/opt/android-sdk

source $ZSH/oh-my-zsh.sh

# Custom Aliases
alias clr='clear'
alias lotus="noglob lotus"
alias lg="log --oneline --decorate --graph"

gitgood() {
  if ! [[ $1 = '' ]] then
    if [[ `git branch --list $1` ]] then
      git fetch
      git rebase -i origin/master
      git push --force
      git checkout master
      git merge $1
      git push origin master
      git push origin :$1
      git branch -d $1
    fi
  fi
}
