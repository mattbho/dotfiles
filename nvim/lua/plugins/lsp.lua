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
	nnoremap("<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

local path_to_elixirls = vim.fn.expand("~/elixirls/release/language_server.sh")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local servers = { "tsserver", "graphql", "jsonls", "cssls", "hls" }
for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
		single_file_support = true,
	})
end

nvim_lsp.html.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	init_options = {
		embeddedLanguages = {
			css = true,
			javascript = true,
			elixir = true,
			heex = true,
		},
	},
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

USER = vim.fn.expand("$USER")

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require("lspconfig").sumneko_lua.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
				-- Setup your lua path
				path = runtime_path,
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
