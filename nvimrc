set nocompatible              " be iMproved, required
filetype off                  " required
syntax enable
colorscheme molokai
set guifont=Monaco:h16
" turn on line numbers
set number

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

" Set new file tabs, overrided by vim-sleuth
set tabstop=4
set shiftwidth=4
set expandtab
set hlsearch
set mouse=a

" test wild ignore case May 4th, 2015
if exists("&wildignorecase")
   set wildignorecase
endif

call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'

" Multiple Word Selection using Ctrl+n
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-sleuth'
Plugin 'cakebaker/scss-syntax.vim'

" Moves lines up and down with cmd+j/k
Plugin 'matze/vim-move'
Plugin 'raimondi/delimitmate'
Plugin 'tpope/vim-fugitive'

" Ruby / Rails specific plugins
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-endwise' " Adds end to things that need it...

" The nerdtree
Plugin 'scrooloose/nerdtree'
" Laravel Blade Syntax
Plugin 'xsbeats/vim-blade'

" Color Scheme
Bundle 'https://github.com/tomasr/molokai.git'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" Map jj to escape key to avoid pressing ESC
:imap jj <Esc>
" Required for airline to show up
set laststatus=2
" Set more natural splits
set splitright
set splitbelow
" Nerdtree styled :Explore
let g:netrw_liststyle=3
" DelimitMate expanding
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
" Change Modifier for Moving items up and down
let g:move_key_modifier = 'D'
" Clear all trailling whitespace on save
autocmd BufWritePre * :%s/\s\+$//e
" Use ~/.vimrc.local if exists
if filereadable(glob("~/.vimrc.local"))
    source ~/.vimrc.local
endif
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
cabbrev E NERDTree
