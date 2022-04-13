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
nnoremap("<leader>fs", "<cmd>Telescope session-lens search_session<cr>")
nnoremap("gr", "<cmd>lua require'telescope.builtin'.lsp_references{}<cr>")
nnoremap("gd", "<cmd>lua require'telescope.builtin'.lsp_definitions{}<cr>")
nnoremap("gs", "<cmd>lua require'telescope.builtin'.lsp_document_symbols{}<cr>")
nnoremap(
	"<space>ca",
	"<cmd>lua require'telescope.builtin'.lsp_code_actions(require('telescope.themes').get_cursor({}))<cr>"
)
nnoremap("<space>E", "<cmd>lua require'telescope.builtin'.diagnostics({ bufnr = 0 })<cr>")
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
