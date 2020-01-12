call plug#begin('~/.local/share/nvim/plugged')
  Plug 'drewtempelmeyer/palenight.vim'
  Plug 'itchyny/lightline.vim'
  Plug 'sheerun/vim-polyglot'
  Plug 'kien/ctrlp.vim'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-endwise'
  Plug 'janko/vim-test'
  Plug 'tpope/vim-sleuth'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-vinegar'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'qpkorr/vim-bufkill'
  Plug 'mhinz/vim-grepper'
  Plug 'ap/vim-buftabline'
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  " Ranger
  Plug 'francoiscabrol/ranger.vim'
  Plug 'rbgrouleff/bclose.vim'
  " ^ Requires python 3 && pip3 install --user pynvim
  Plug 'matze/vim-move', { 'tag': 'v1.3' }
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'neomake/neomake'
  " Languages
  Plug 'elixir-editors/vim-elixir'
  Plug 'slashmili/alchemist.vim'
call plug#end()


set backupcopy=yes
filetype off
syntax enable
set hidden
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set hlsearch
set mouse=a
set number
set title
set clipboard=unnamedplus
set autoread
set termguicolors
set background=dark
set splitright
set splitbelow

colorscheme palenight
let g:palenight_terminal_italics=1
let g:lightline = {
      \ 'colorscheme': 'palenight',
      \ }
"let g:lightline.colorscheme = 'palenight'

" Buffer tab line colors
" highlight BufTabLineCurrent cterm=NONE ctermbg=15 ctermfg=8 gui=NONE guibg=#ffffff guifg=#d70000
highlight BufTabLineCurrent cterm=NONE ctermfg=15 ctermbg=8 guibg=#ffffff guifg=#000000
highlight BufTabLineActive  cterm=NONE ctermfg=243 ctermbg=White guibg=#1d1f2b
highlight BufTabLineHidden  cterm=NONE ctermfg=242
highlight BufTabLineFill    cterm=NONE ctermfg=242

" set ignore options
if exists("&wildignorecase")
   set wildignorecase
endif

" ignores stuff I dont care about
set wildmode=list:longest
set wildmenu
set wildignore=*.o,*.obj,*~
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=*node_modules*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=_build/**
set wildignore+=deps/**
set wildignore+=tmp/**
set wildignore+=*/.git/*,*/tmp/*,*.swp
set wildignore+=*.cache
set wildignore+=*.png,*.jpg,*.gif

" clear all trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e
autocmd! BufWritePost * Neomake
autocmd! BufRead * Neomake

cnoreabbrev E Ranger

imap jj <Esc>

nnoremap 0 ^

map <C-H> :bprev<CR>
map <C-L> :bnext<CR>
map <Leader>i :e <C-R>=expand("%:p:h")."/index.js"<CR><CR>
map <Leader>vi :e ~/.config/nvim/init.vim<CR>
map <Leader>so :source ~/.config/nvim/init.vim<CR>

call neomake#configure#automake('w')

if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif

let g:move_key_modifier = 'C'
let g:deoplete#enable_at_startup = 1
let g:ranger_replace_netrw = 1

" Elixir"
autocmd BufRead,BufNewFile *.{exs} setlocal filetype=elixir

" Prevent last open buffer from being deleted
" autocmd BufDelete * if len(filter(range(1, bufnr('$')), '! empty(bufname(v:val)) && buflisted(v:val)')) == 1 | quit | endif

" neomake makers
let g:neomake_elixir_enabled_makers = ['mix', 'credo']

