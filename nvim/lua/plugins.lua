local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
end

require("packer").startup(function(use)
	-- Manage self
	use("wbthomason/packer.nvim")
	-- LSP
	use({
		"neovim/nvim-lspconfig",
		config = [[ require("plugins.lsp") ]],
	})
	use({
		"jose-elias-alvarez/null-ls.nvim",
		config = [[ require("plugins.null-ls")]],
	})
	use({
		"j-hui/fidget.nvim",
		config = function()
			require("fidget").setup({})
		end,
	})
	-- Completion
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lsp",
			"saadparwaiz1/cmp_luasnip",
			"L3MON4D3/LuaSnip",
			"onsails/lspkind-nvim",
		},
		config = [[ require("plugins.completion") ]],
	})
	use("rafamadriz/friendly-snippets")
	--Navigation
	use({
		"kyazdani42/nvim-tree.lua",
		config = [[ require("plugins.nvim-tree") ]],
	})
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
		config = [[ require("plugins.telescope") ]],
	})
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({
		"goolord/alpha-nvim",
		config = [[ require("plugins.alpha") ]],
	})
	--Syntax
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		requires = {
			"windwp/nvim-ts-autotag",
			"p00f/nvim-ts-rainbow",
		},
		config = [[ require("plugins/treesitter") ]],
	})
	use("elixir-editors/vim-elixir")
	use({
		"lukas-reineke/indent-blankline.nvim",
		config = [[ require("plugins.indent-blankline") ]],
	})
	-- Git
	use({
		"lewis6991/gitsigns.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("gitsigns").setup()
		end,
	})
	use({
		"TimUntersberger/neogit",
		requires = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
		},
		config = function()
			require("neogit").setup({ integrations = { diffview = true } })
		end,
	})
	use("tpope/vim-fugitive")
	-- Theme
	use({
		"olimorris/onedarkpro.nvim",
		config = [[ require("plugins.colorscheme")]],
	})
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
		config = [[ require("plugins.lualine")]],
	})
	-- Tools
	use({
		"folke/zen-mode.nvim",
		config = function()
			require("zen-mode").setup()
		end,
	})
	use("b3nj5m1n/kommentary")
	use({
		"vim-test/vim-test",
		requires = "preservim/vimux",
		config = [[ require("plugins.vimtest")]],
	})
	use({
		"aserowy/tmux.nvim",
		config = function()
			require("tmux").setup({ navigation = { enable_default_keybindings = true } })
		end,
	})
	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup()
		end,
	})
	use({
		"phaazon/hop.nvim",
		config = function()
			require("hop").setup()
		end,
	})
	use({
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	})
	use({
		"rmagatti/auto-session",
		config = function()
			require("auto-session").setup({
				log_level = "info",
				auto_session_suppress_dirs = { "~/", "~/.config" },
			})
		end,
	})
	use({
		"rmagatti/session-lens",
		requires = { "rmagatti/auto-session", "nvim-telescope/telescope.nvim" },
		config = function()
			require("session-lens").setup({ path_display = { "shorten" } })
		end,
	})
	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
