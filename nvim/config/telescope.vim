lua <<EOF
require('telescope').load_extension('fzf')
local actions = require('telescope.actions')
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close
      }
    }
  }
}

EOF


nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <silent> gr <cmd>lua require'telescope.builtin'.lsp_references{}<CR>
nnoremap <silent> gd <cmd>lua require'telescope.builtin'.lsp_definitions{}<CR>
nnoremap <silent> gs <cmd>lua require'telescope.builtin'.lsp_document_symbols{}<CR>
nnoremap <silent> <space>ca <cmd>lua require'telescope.builtin'.lsp_code_actions{}<CR>
nnoremap <silent> <space>E <cmd>lua require'telescope.builtin'.lsp_document_diagnostics{}<CR>
