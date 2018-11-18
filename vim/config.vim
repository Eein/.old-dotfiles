" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme='hybrid'

" vim-move
let g:move_key_modifier = 'C'

" Rest in RIP
" https://elliotekj.com/2016/11/22/setup-ctrlp-to-use-ripgrep-in-vim/
if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif

" grepper
let g:grepper = {
    \ 'tools': ['rg', 'git'] }
