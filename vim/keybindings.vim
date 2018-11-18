" --------------------------------------
"  Remaps
" --------------------------------------

" remaps 0 to go to first character of line
nnoremap 0 ^
" remaps backticks for tmux behavior
nnoremap ' `
nnoremap ` '

" Buffers
map <C-H> :bprev<CR>
map <C-L> :bnext<CR>

" --------------------------------------
"  Leader Maps
" --------------------------------------

" Mapping Leaders
map <Leader>vi :e ~/.dotfiles/vimrc<CR>
map <Leader>o :e ~/Library/Mobile Documents/com~apple~CloudDocs/Documents/tasks.org<CR>
map <Leader>so :source ~/.vimrc<CR>

" opens the index file of a named connected component
map <Leader>i :e <C-R>=expand("%:p:h")."/index.js"<CR><CR>

" --------------------------------------
"  Map
" --------------------------------------

" maps :E to File Explorer
cnoreabbrev E VimFilerExplorer

" Remap wq to close buffer
cnoreabbrev wq w<bar>BD

" Fix Backspace
set backspace=eol,start,indent

" Map jj to escape key to avoid pressing ESC
:imap jj <Esc>


