" prevents the last open buffer from being closed
autocmd BufDelete * if len(filter(range(1, bufnr('$')), '! empty(bufname(v:val)) && buflisted(v:val)')) == 1 | quit | endif

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
set wildignore+=tmp/**
set wildignore+=*/.git/*,*/tmp/*,*.swp
set wildignore+=*.cache
set wildignore+=*.png,*.jpg,*.gif

" clear all trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e
autocmd! BufWritePost * Neomake
autocmd! BufRead * Neomake

