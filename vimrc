set nocompatible              " be iMproved, required
filetype off                  " required
syntax enable
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

" Yells loudly at all of my habits
Plugin 'scrooloose/syntastic'

" Multiple Word Selection using Ctrl+n
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-sleuth'
Plugin 'cakebaker/scss-syntax.vim'

" Moves lines up and down with cmd+j/k
Plugin 'matze/vim-move'
"Plugin 'raimondi/delimitmate'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-fugitive'

" Ruby / Rails specific plugins
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-endwise' " Adds end to things that need it...

" The nerdtree
" Plugin 'scrooloose/nerdtree'
" Laravel Blade Syntax
Plugin 'xsbeats/vim-blade'
Plugin 'lilydjwg/colorizer'

" Color Scheme
Plugin 'tomasr/molokai'

" Vim Snippets
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Map jj to escape key to avoid pressing ESC
:imap jj <Esc>

" Molokai + Color edits
colorscheme molokai
let g:rehash256 = 1

" Set Cursor Line Number Colors
hi clear CursorLine
hi CursorLineNR ctermfg=026 cterm=bold
hi LineNr ctermbg=235
augroup CLSet
  autocmd! ColorScheme * hi clear CursorLine
  autocmd! ColorScheme * hi CursorLineNR cterm=bold
augroup END
highlight LineNr ctermbg=black
set cursorline

" Required for airline to show up
set laststatus=2

" Set more natural splits
set splitright
set splitbelow

" Nerdtree styled :Explore
let g:netrw_liststyle=3

" DelimitMate expanding
" let delimitMate_expand_cr = 1
" let delimitMate_expand_space = 1

" Clear all trailling whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" Use ~/.vimrc.local if exists
if filereadable(glob("~/.vimrc.local"))
   source ~/.vimrc.local
endif

" Remove both scrollbars
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

" Set NERDTree to :E
" cabbrev E NERDTree

" Set .es6 files to use javascript syntax
au BufNewFile,BufRead *.es6 set filetype=javascript

" Whiney Stuff - syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_scss_checkers = ["scss_lint"]
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_sass_check_partials = 0
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_style_warning_symbol = "✗"
let g:syntastic_style_error_symbol = "✗"

"syntastic_error_symbol - For syntax errors, defaults to '>>'
"syntastic_style_error_symbol - For style errors, defaults to 'S>'
"syntastic_warning_symbol - For syntax warnings, defaults to '>>'
"syntastic_style_warning_symbol - For style warnings, defaults to 'S>'


" Change Modifier for Moving items up and down
let g:move_key_modifier = 'C'
