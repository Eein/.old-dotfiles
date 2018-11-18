set background=dark
colorscheme hybrid

" visual matching parens
hi MatchParen ctermfg=033 ctermbg=234 cterm=bold

" marks things passing 160 characters
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

" sets cursor line number colors
hi clear CursorLine
hi CursorLineNR ctermfg=026 cterm=bold
hi LineNr ctermbg=235
augroup CLSet
  autocmd! ColorScheme * hi clear CursorLine
  autocmd! ColorScheme * hi CursorLineNR cterm=bold
augroup END
highlight LineNr ctermbg=black
set cursorline

" set more natural splits
set splitright
set splitbelow

" remove both scrollbars
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar


