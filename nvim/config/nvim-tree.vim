let g:nvim_tree_quit_on_open = 1
let g:nvim_tree_indent_markers = 1
let g:nvim_tree_git_hl = 1
let g:nvim_tree_highlight_opened_files = 1
let g:nvim_tree_disable_window_picker = 1
let g:nvim_tree_hide_dotfiles = 1
lua<<EOF
require('nvim-tree').setup{
  view = {
    width = 50,
    side = 'right',
  }
}
EOF
nnoremap <C-n> :NvimTreeToggle<CR>
nmap <silent> nf :NvimTreeFindFile<CR>
nmap <silent> nr :NvimTreeRefresh<CR>
