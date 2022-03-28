local onedarkpro = require("onedarkpro")
onedarkpro.setup({
	colors = {
		bg = "#282c34",
	},
	options = {
		bold = true, -- Use the themes opinionated bold styles?
		italic = true, -- Use the themes opinionated italic styles?
		underline = true, -- Use the themes opinionated underline styles?
		undercurl = true, -- Use the themes opinionated undercurl styles?
		cursorline = true, -- Use cursorline highlighting?
		transparency = false, -- Use a transparent background?
		terminal_colors = false, -- Use the theme's colors for Neovim's :terminal?
		window_unfocussed_color = false, -- When the window is out of focus, change the normal background?
	},
})
onedarkpro.load()
