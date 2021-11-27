local utils = require("utils")
local nmap = utils.nmap
local vmap = utils.vmap
local imap = utils.imap
local xmap = utils.xmap
local omap = utils.omap
local nnoremap = utils.nnoremap
local inoremap = utils.inoremap
local vnoremap = utils.vnoremap

-- Yank to clipboard
vnoremap("Y", [["+y]])

nnoremap("gb", "<cmd>Gitsigns blame_line<cr>")
nnoremap ("<leader>ff", "<cmd>Telescope find_files<cr>")
nnoremap ("<leader>fg", "<cmd>Telescope live_grep<cr>")
nnoremap ("<leader>fb", "<cmd>Telescope buffers<cr>")
nnoremap ("<leader>fh", "<cmd>Telescope help_tags<cr>")
nnoremap ("gr", "<cmd>lua require'telescope.builtin'.lsp_references{}<cr>")
nnoremap ("gd", "<cmd>lua require'telescope.builtin'.lsp_definitions{}<cr>")
nnoremap ("gs", "<cmd>lua require'telescope.builtin'.lsp_document_symbols{}<cr>")
nnoremap ("<space>ca", "<cmd>lua require'telescope.builtin'.lsp_code_actions(require('telescope.themes').get_cursor({}))<cr>")
nnoremap ("<space>E", "<cmd>lua require'telescope.builtin'.lsp_document_diagnostics{}<cr>")
