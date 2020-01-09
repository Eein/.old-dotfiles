zstyle ':completion:*' list-colors

export GPG_TTY=$(tty)
alias vim='nvim'

alias tmux='tmux -2'  # for 256color
alias xi='xbps-install'

### Added by Zplugin's installer
source ~/.zplugin/bin/zplugin.zsh
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
### End of Zplugin installer's chunk

zplugin light zsh-users/zsh-autosuggestions
zplugin light zdharma/fast-syntax-highlighting
zplugin light zdharma/history-search-multi-word
zplugin light denysdovhan/spaceship-prompt

alias ls='exa'
alias l='exa -l --all --group-directories-first --git'

export SPACESHIP_PROMPT_ADD_NEWLINE=false
export SPACESHIP_GIT_BRANCH_PREFIX=""
export SPACESHIP_CHAR_SYMBOL="› "
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
autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="/usr/local/opt/libpq/bin:$PATH"
export PATH=~/.cargo/bin:$PATH
