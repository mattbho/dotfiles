local nnoremap = require("utils").nnoremap
local nmap = require("utils").nmap
local g = vim.g

g.nvim_tree_git_hl = 1
g.nvim_tree_highlight_opened_files = 1

require("nvim-tree").setup({
	view = {
		width = 45,
		side = "right",
	},
	filters = {
		dotfiles = true,
	},
	git = {
		ignore = false,
	},
	actions = {
		open_file = {
			quit_on_open = true,
			window_picker = {
				enable = false,
			},
		},
	},
	renderer = {
		indent_markers = {
			enable = true,
		},
	},
})
nnoremap("<C-n>", ":NvimTreeToggle<CR>")
nmap("nf", ":NvimTreeFindFile<CR>")
nmap("nr", ":NvimTreeRefresh<CR>")
