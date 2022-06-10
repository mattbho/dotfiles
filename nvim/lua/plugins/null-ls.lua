local null_ls = require("null-ls")

local function has_eslint_configured(utils)
	return utils.root_has_file({".eslintrc.js", ".eslintrc.json"})
end

local sources = {
	null_ls.builtins.formatting.eslint_d.with({ condition = has_eslint_configured }),
	null_ls.builtins.diagnostics.eslint_d.with({ condition = has_eslint_configured }),
	null_ls.builtins.code_actions.eslint_d.with({ condition = has_eslint_configured }),
	null_ls.builtins.formatting.mix,
  null_ls.builtins.formatting.prettier_d_slim.with({
      condition = function()
        return null_ls.get_source({ name = "eslint_d", method = null_ls.methods.FORMATTING }) == 0
      end,
    }),
	null_ls.builtins.formatting.stylua,
	null_ls.builtins.diagnostics.credo,
	null_ls.builtins.code_actions.gitsigns,
}

require("null-ls").setup({
	sources = sources,
})
