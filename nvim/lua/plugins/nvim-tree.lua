local nnoremap = require("utils").nnoremap
local nmap = require("utils").nmap
local g = vim.g

g.nvim_tree_quit_on_open = 1
g.nvim_tree_indent_markers = 1
g.nvim_tree_git_hl = 1
g.nvim_tree_highlight_opened_files = 1
g.nvim_tree_disable_window_picker = 1

require("nvim-tree").setup{
  view = {
    width = 45,
    side = "right",
  }
}
nnoremap("<C-n>", ":NvimTreeToggle<CR>")
nmap("nf", ":NvimTreeFindFile<CR>")
nmap("nr", ":NvimTreeRefresh<CR>")
