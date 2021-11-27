local nvim_lsp = require("lspconfig")
local utils = require("utils")
local nnoremap = utils.nnoremap

local on_attach = function(_, bufnr)
  local opts = {bufnr = bufnr}

  nnoremap("K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  nnoremap("gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  nnoremap("<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
  nnoremap("<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
  nnoremap("<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
  nnoremap("<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
  nnoremap("<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  nnoremap("<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
  nnoremap("[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
  nnoremap("]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
  nnoremap("<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
  nnoremap("<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

local path_to_elixirls = vim.fn.expand("~/.elixir-ls/release/language_server.sh")
local capabilities = vim.lsp.protocol.make_client_capabilities()

local servers = { "tsserver", "graphql", "html", "jsonls", "cssls", "sqls" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup{
    on_attach = on_attach,
    capabilities = capabilities
  }
end

nvim_lsp.elixirls.setup{
  cmd = {path_to_elixirls},
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    elixirLS = {
      dialyzerEnabled = true
    }
  }
}

USER = vim.fn.expand("$USER")

local sumneko_root_path = ""
local sumneko_binary = ""

sumneko_root_path = "/Users/" .. USER .. "/.config/nvim/lua-language-server"
sumneko_binary = "/Users/" .. USER .. "/.config/nvim/lua-language-server/bin/macOS/lua-language-server"

require("lspconfig").sumneko_lua.setup {
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you"re using (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
                -- Setup your lua path
                path = vim.split(package.path, ";")
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {"vim"}
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = {[vim.fn.expand("$VIMRUNTIME/lua")] = true, [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true},
                maxPreload = 10000
            }
        }
    }
}

local null_ls = require("null-ls")

local sources = {
  null_ls.builtins.formatting.eslint,
  null_ls.builtins.formatting.mix,
  null_ls.builtins.formatting.prettier.with({
    filetypes = { "css", "scss", "html", "json", "yaml", "markdown" }
  }),
  null_ls.builtins.diagnostics.eslint,
  null_ls.builtins.code_actions.gitsigns,
}

null_ls.config({sources = sources})
require("lspconfig")["null-ls"].setup({
    on_attach = on_attach
})
