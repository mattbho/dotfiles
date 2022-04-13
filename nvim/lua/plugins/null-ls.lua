local null_ls = require("null-ls")

local sources = {
	null_ls.builtins.formatting.eslint_d,
	null_ls.builtins.formatting.mix,
	null_ls.builtins.formatting.prettier_d_slim.with({
		filetypes = { "css", "scss", "html", "json", "yaml", "markdown" },
	}),
	null_ls.builtins.formatting.stylua,
	null_ls.builtins.diagnostics.eslint_d,
	null_ls.builtins.diagnostics.credo,
	null_ls.builtins.code_actions.gitsigns,
}

require("null-ls").setup({
	sources = sources,
})
