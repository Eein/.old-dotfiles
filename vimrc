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
set clipboard=unnamedplus

" Better remaps
nnoremap 0 ^
nnoremap ' `
nnoremap ` '

" Buffers
map <C-H> :bprev<CR>
map <C-L> :bnext<CR>

" Mapping Leaders
map <Leader>vi :e ~/.dotfiles/vimrc<CR>
map <Leader>so :source ~/.vimrc<CR>
map <Leader>i :e <C-R>=expand("%:p:h")."/index.js"<CR><CR>
cnoreabbrev E VimFilerExplorer

" Remap wq and q to close buffer
cnoreabbrev wq w<bar>BD

" cnoreabbrev <expr> q getcmdtype() == ":" && getcmdline() == 'q' ? 'bd' : 'q'
autocmd BufDelete * if len(filter(range(1, bufnr('$')), '! empty(bufname(v:val)) && buflisted(v:val)')) == 1 | quit | endif


" Rspec Leaders
autocmd BufRead,BufNewFile *.{rb} setlocal filetype=ruby
autocmd Filetype ruby map <Leader>t :call RunCurrentSpecFile()<CR>
autocmd Filetype ruby map <Leader>T :call RunAllSpecs()<CR>

" Elixir Leaders
autocmd BufRead,BufNewFile *.{exs} setlocal filetype=exunit
autocmd FileType exunit map <leader>t :call Send_to_Tmux("mix test ". expand('%:p') ."\n")<CR>

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
set wildignore+=*/.git/*,*/tmp/*,*.swp
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
Plug 'neomake/neomake'
Plug 'qpkorr/vim-bufkill'
Plug 'duggiefresh/vim-easydir'
Plug 'mhinz/vim-grepper'

" temp lua
Plug 'tbastos/vim-lua'

" NETRW replacement
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimfiler'

"" Multiple Word Selection using Ctrl+n
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-sleuth'
Plug 'cakebaker/scss-syntax.vim'

"" Moves lines up and down with cmd+j/k
Plug 'matze/vim-move'

"" QOL
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

" Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

"" Ruby / Rails specific Plugs
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-endwise' " Adds end to things that need it...
Plug 'thoughtbot/vim-rspec'

"" Elixir
Plug 'slashmili/alchemist.vim'

"" react
Plug 'mxw/vim-jsx'
Plug 'benjie/neomake-local-eslint.vim'

"" Color Scheme
Plug 'w0ng/vim-hybrid'

"" Vim Snippets
" Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'SirVer/ultisnips'

" Node File Stuff
Plug 'moll/vim-node'

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

" Set more natural splits
set splitright
set splitbelow

" Nerdtree styled :Explore
" let g:netrw_liststyle=3

" Clear all trailling whitespace on save
autocmd BufWritePre * :%s/\s\+$//e
autocmd! BufWritePost * Neomake
autocmd! BufRead * Neomake

" Remove both scrollbars
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

" Airline Settings
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" Change Modifier for Moving items up and down
let g:move_key_modifier = 'C'

let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_javascript_jsx_enabled_makers = ['eslint']
let g:neomake_ruby_enabled_makers = ['rubocop']
let g:neomake_html_enabled_makers = []
let g:neomake_scss_scsslint_args = ['-c', '~/.scss-lint.yml']
let g:neomake_elixir_enabled_makers = []
let g:jsx_ext_required = 0
let g:UltiSnipsSnippetsDir = '~/.dotfiles/config/nvim/snippets/'

" Send tests to new tmux window
let g:rspec_command = 'call Send_to_Tmux("bundle exec rspec {spec}\n")'
noremap <leader>e :!elixir %:p<CR>

" https://elliotekj.com/2016/11/22/setup-ctrlp-to-use-ripgrep-in-vim/
if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif

let g:grepper = {
    \ 'tools': ['rg', 'git'] }
