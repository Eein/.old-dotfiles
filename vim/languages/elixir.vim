" exunit spec runners
autocmd BufRead,BufNewFile *.{exs} setlocal filetype=elixir
autocmd FileType exunit map <leader>t :call Send_to_Tmux("mix test ". expand('%:p') ."\n")<CR>

" neomake makers
let g:neomake_elixir_enabled_makers = []
