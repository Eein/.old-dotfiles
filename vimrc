filetype off
set hidden
syntax enable
set guifont=Monaco:h14
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set hlsearch
set mouse=a
set number
set title

" Better remaps
nnoremap 0 ^
nnoremap ' `
nnoremap ` '

" Buffers
map <C-H> :bprev<CR>
map <C-L> :bnext<CR>

" Remap wq and q to close buffer
cnoreabbrev wq w<bar>BD
" cnoreabbrev <expr> q getcmdtype() == ":" && getcmdline() == 'q' ? 'bd' : 'q'
autocmd BufDelete * if len(filter(range(1, bufnr('$')), '! empty(bufname(v:val)) && buflisted(v:val)')) == 1 | quit | endif

" Mapping Leaders
map <Leader>vi :e ~/.dotfiles/vimrc<CR>
map <Leader>so :source ~/.vimrc<CR>
map <Leader>i mmgg=G'm

" Rspec Leaders
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>T :call RunAllSpecs()<CR>

" Global copy paste
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
set wildignore+=*node_modules*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.cache
set wildignore+=*.png,*.jpg,*.gif

" https://github.com/junegunn/vim-plug
call plug#begin('~/.nvim/plugged')
"
"" Misc
Plug 'sheerun/vim-polyglot' " Fix for weird comment issue: https://github.com/othree/yajs.vim/commit/b069d90bc41f9f21ccad1e918262bf992d2aa75f
Plug 'bling/vim-airline'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'jgdavey/tslime.vim'

"" C++
Plug 'vim-scripts/a.vim'
"" Multiple Word Selection using Ctrl+n
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-sleuth'
Plug 'cakebaker/scss-syntax.vim'
"
"" Moves lines up and down with cmd+j/k
Plug 'matze/vim-move'
"
"" QOL
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'qpkorr/vim-bufkill'
"
"" Ruby / Rails specific Plugs
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-endwise' " Adds end to things that need it...
Plug 'thoughtbot/vim-rspec'

"" Color Scheme
Plug 'w0ng/vim-hybrid'
Plug 'ap/vim-css-color'

"" Support for Twig
Plug 'Glench/Vim-Jinja2-Syntax'
"
"" react
Plug 'mxw/vim-jsx'
"
"" Vim Snippets
Plug 'Eein/neomake'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
"
"" Nyaovim Plugs
Plug 'rhysd/nyaovim-markdown-preview'
"
"" All of your Plugins must be added before the following line
call plug#end()            " required

filetype plugin indent on    " required

" Molokai + Color editor
set background=dark
colorscheme hybrid

" Map jj to escape key to avoid pressing ESC
:imap jj <Esc>

" Fix Matching Parenths
hi MatchParen      ctermfg=033  ctermbg=234 cterm=bold

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
" set laststatus=2

" Set more natural splits
set splitright
set splitbelow

" Nerdtree styled :Explore
let g:netrw_liststyle=3
cabbrev E Explore

" Clear all trailling whitespace on save
autocmd BufWritePre * :%s/\s\+$//e
autocmd! BufWritePost * Neomake
autocmd! BufRead * Neomake

" Remove both scrollbars
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

" Set .es6 files to use javascript syntax
au BufNewFile,BufRead *.es6 set filetype=javascript

" Set .twig files to jinja2 (only way)
au BufRead,BufNewFile *.twig set filetype=jinja
au BufRead,BufNewFile *.html set filetype=jinja

" Airline Settings
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" Change Modifier for Moving items up and down
let g:move_key_modifier = 'C'
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_js_enabled_makers = ['eslint']
let g:neomake_jsx_enabled_makers = ['eslint']
let g:neomake_ruby_enabled_makers = ['rubocop']
let g:neomake_html_enabled_makers = []
let g:neomake_scss_scsslint_args = ['-c', '~/.scss-lint.yml']


let g:neomake_elixir_mix_maker = {
      \ 'exe' : 'mix',
      \ 'args': ['compile', '--warnings-as-errors'],
      \ 'cwd': getcwd(),
      \ 'errorformat':
        \ '** %s %f:%l: %m,' .
        \ '%f:%l: warning: %m'
      \ }

let g:neomake_elixir_enabled_makers = ['mix']

" React
let g:jsx_ext_required = 0

" Send tests to new tmux window
let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'

" Nayovim Eager Update
let g:markdown_preview_eager = 1

nmap <buffer><silent><Leader>j <Plug>(markdown-preview-scroll-down) <Plug>(markdown-preview-scroll-down) <Plug>(markdown-preview-scroll-down)
nmap <buffer><silent><Leader>k <Plug>(markdown-preview-scroll-up) <Plug>(markdown-preview-scroll-up) <Plug>(markdown-preview-scroll-up)
