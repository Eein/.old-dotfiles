call plug#begin('~/.local/share/nvim/plugged')
  Plug 'kaicataldo/material.vim'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
call plug#end()

set termguicolors
set background=dark
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" COLORS
let g:material_theme_style = 'darker'
let g:material_terminal_italics = 1
colorscheme material
