" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

" https://github.com/junegunn/vim-plug
call plug#begin('~/.nvim/plugged')

source ~/.vim/plugins.vim

"" All of your Plugins must be added before the following line
call plug#end()            " required

filetype plugin indent on    " required

