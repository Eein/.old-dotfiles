" rspec test runners
autocmd BufRead,BufNewFile *.{rb} setlocal filetype=ruby
autocmd Filetype ruby map <Leader>t :call RunCurrentSpecFile()<CR>
autocmd Filetype ruby map <Leader>T :call RunAllSpecs()<CR>

" neomake makers
let g:neomake_ruby_enabled_makers = ['rubocop']

" TODO: is this needed anymore?
let g:rspec_command = 'call Send_to_Tmux("bundle exec rspec {spec}\n")'

