local utils = require("utils")
local nnoremap = utils.nnoremap
local vnoremap = utils.vnoremap

-- Yank to clipboard
vnoremap("Y", [["+y]])

nnoremap("gb", "<cmd>Gitsigns blame_line<cr>")
nnoremap("<leader>ff", "<cmd>Telescope find_files<cr>")
nnoremap("<leader>fr", "<cmd>Telescope oldfiles<cr>")
nnoremap("<leader>fg", "<cmd>Telescope live_grep<cr>")
nnoremap("<leader>fb", "<cmd>Telescope buffers<cr>")
nnoremap("<leader>fw", "<cmd>Telescope grep_string<cr>")
nnoremap("<leader>fh", "<cmd>Telescope help_tags<cr>")
nnoremap("gr", "<cmd>Lspsaga lsp_finder<cr>")
nnoremap("gd", "<cmd>Lspsaga goto_definition<cr>")
nnoremap("<space>e", "<cmd>Lspsaga show_line_diagnostics<cr>")
nnoremap("<space>rn", "<cmd>Lspsaga rename<CR>")
nnoremap("K", "<cmd>Lspsaga hover_doc<CR>")
nnoremap("<space>ca", "<cmd>Lspsaga code_action<CR>")
nnoremap("<leader>ng", "<cmd>Neogit<cr>")
nnoremap("<leader>dv", "<cmd>DiffviewOpen<cr>")
nnoremap("<leader>xx", "<cmd>Trouble<cr>")
nnoremap("<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>")
nnoremap("<leader>xd", "<cmd>Trouble document_diagnostics<cr>")
nnoremap("<leader>xl", "<cmd>Trouble loclist<cr>")
nnoremap("<leader>xq", "<cmd>Trouble quickfix<cr>")
nnoremap("gR", "<cmd>Trouble lsp_references<cr>")
nnoremap("<leader>ps", "<cmd>PackerSync<cr>")
nnoremap("f", "<cmd>HopWord<cr>")
nnoremap("F", "<cmd>HopPattern<cr>")

