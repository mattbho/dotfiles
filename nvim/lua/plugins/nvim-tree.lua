local nnoremap = require("utils").nnoremap
local nmap = require("utils").nmap

require("nvim-tree").setup({
	view = {
		adaptive_size = true,
		width = 45,
		side = "right",
	},
	diagnostics = {
		enable = true,
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
    highlight_git = true,
    highlight_opened_files = "all",
		indent_markers = {
			enable = true,
		},
	},
})
nnoremap("<C-n>", ":NvimTreeToggle<CR>")
nmap("nf", ":NvimTreeFindFile<CR>")
nmap("nr", ":NvimTreeRefresh<CR>")
