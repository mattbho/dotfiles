local nvim_lsp = require("lspconfig")
local utils = require("utils")
local nnoremap = utils.nnoremap

local on_attach = function(_, bufnr)
	local opts = { bufnr = bufnr }

	nnoremap("K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	nnoremap("gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	nnoremap("<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
	nnoremap("<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
	nnoremap("<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
	nnoremap("<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	nnoremap("<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	nnoremap("<space>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
	nnoremap("[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
	nnoremap("<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	nnoremap("]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
	nnoremap("<space>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
	nnoremap("<space>f", "<cmd>lua vim.lsp.buf.format()<CR>", opts)
end

local path_to_elixirls = vim.fn.expand("~/elixirls/release/language_server.sh")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require("mason").setup()
require("mason-lspconfig").setup()

nvim_lsp.tsserver.setup({
	on_attach = on_attach,
	-- filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
	cmd = { "typescript-language-server", "--stdio" },
})

nvim_lsp.tailwindcss.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp.pyright.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp.cssls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp.prismals.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp.elixirls.setup({
	cmd = { path_to_elixirls },
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		elixirLS = {
			dialyzerEnabled = true,
			fetchDeps = true,
		},
	},
})

nvim_lsp.lua_ls.setup({
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
})

vim.diagnostic.config({
	virtual_text = false,
})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
