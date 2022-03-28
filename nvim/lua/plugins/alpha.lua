local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")
dashboard.section.buttons.val = {
	dashboard.button("e", "  New file", ":ene <CR>"),
	dashboard.button("<leader> f f", "  Find File"),
	dashboard.button("<leader> f g", "  Find Word"),
	dashboard.button("<leader> f r", "  Recents"),
	dashboard.button("<leader> p s", "  Update Plugins"),
	dashboard.button("q", "  Exit", ":qa<CR>"),
}
alpha.setup(dashboard.opts)
