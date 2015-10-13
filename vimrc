set nocompatible
set hidden
filetype off
syntax enable
set guifont=Monaco:h16
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set hlsearch
set mouse=a
set number
set title

"Make 0 go to front of line
nnoremap 0 ^
nnoremap ' `
nnoremap ` '

" Mapping Leaders
map <Leader>vi :tabe $MYVIMRC<CR>
map <Leader>so :source $MYVIMRC<CR>
map <Leader>i mmgg=G'm

" Rspec Leaders
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>T :call RunAllSpecs()<CR>

" Copy paste
map <Leader>y "+y
map <Leader>p "+p

" Fix Backspace
set backspace=eol,start,indent

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim


" Set ignore options
if exists("&wildignorecase")
   set wildignorecase
endif

set wildmode=list:longest
set wildmenu
set wildignore=*.o,*.obj,*~
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.cache
set wildignore+=*.png,*.jpg,*.gif

call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Misc
Plugin 'sheerun/vim-polyglot'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-commentary'

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
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'

" Ruby / Rails specific plugins
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-endwise' " Adds end to things that need it...
Plugin 'thoughtbot/vim-rspec'

" The nerdtree
" Plugin 'scrooloose/nerdtree'
" Laravel Blade Syntax
Plugin 'xsbeats/vim-blade'
Plugin 'lilydjwg/colorizer'

" Color Scheme
" Plugin 'tomasr/molokai'
" Plugin 'trusktr/seti.vim'
Plugin 'w0ng/vim-hybrid'

" Vim Snippets
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Molokai + Color editor
set background=dark
colorscheme hybrid

" let g:rehash256 = 1

" Map jj to escape key to avoid pressing ESC
:imap jj <Esc>

" Marks things passing 160 characters
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

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
cabbrev E Explore
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

" Set .es6 files to use javascript syntax
au BufNewFile,BufRead *.es6 set filetype=javascript

" Whiney Stuff - syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_scss_checkers = ["scss_lint"]
let g:syntastic_ruby_checkers=['rubocop', 'mri']
let g:syntastic_ruby_rubocop_exec='~/.rbenv/shims/rubocop'
let g:syntastic_eruby_ruby_quiet_messages = {'regex': 'possibly useless use of '}
let g:syntastic_javascript_checkers=['eslint']
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" let g:syntastic_sass_check_partials = 0
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
