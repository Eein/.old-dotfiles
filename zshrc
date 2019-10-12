zstyle ':completion:*' list-colors 

export PATH=~/.cargo/bin:$PATH

alias vim='nvim'

### Added by Zplugin's installer
source ~/.zplugin/bin/zplugin.zsh
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
### End of Zplugin installer's chunk

zplugin light zsh-users/zsh-autosuggestions
zplugin light zdharma/fast-syntax-highlighting
zplugin light zdharma/history-search-multi-word
zplugin light denysdovhan/spaceship-prompt

case `uname` in
  Darwin)
    alias ls='ls -G'
  ;;
  Linux)
    zplugin ice atclone"dircolors -b LS_COLORS > c.zsh" atpull'%atclone' pick"c.zsh"
    zplugin load trapd00r/LS_COLORS
    alias ls='ls --color=auto'
  ;;
esac

export SPACESHIP_PROMPT_ADD_NEWLINE=false
export SPACESHIP_GIT_BRANCH_PREFIX=""
export SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  exec_time     # Execution time
  line_sep      # Line break
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
  )

autoload -Uz compinit && compinit 
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
