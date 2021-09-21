if has('nvim') && !exists('$TMUX')
  " run tests with neoterm in vim-test
  let g:test#strategy = 'neoterm'
else
  let g:test#strategy = 'vimux'
endif

let g:VimuxOrientation = "h"
let g:VimuxHeight = "30"

nmap <silent> <leader>T :TestNearest<CR>
nmap <silent> <leader>t :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>

