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
  use("nvim-tree/nvim-web-devicons")
  -- LSP
  use({
    "neovim/nvim-lspconfig",
    config = [[ require("plugins.lsp") ]],
  })
  use({
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  })
  use({
    "jose-elias-alvarez/null-ls.nvim",
    config = [[ require("plugins.null-ls")]],
  })
  use({
    "j-hui/fidget.nvim",
    branch = "legacy",
    config = function()
      require("fidget").setup({})
    end,
  })
  use({
    "glepnir/lspsaga.nvim",
    opt = true,
    branch = "main",
    event = "LspAttach",
    config = function()
      require("lspsaga").setup({
        lightbulb = {
          enable = false,
        },
      })
    end,
    requires = {
      { "nvim-tree/nvim-web-devicons" },
      { "nvim-treesitter/nvim-treesitter" },
    },
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
  use({
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  })

  use("elixir-editors/vim-elixir")
  use("prisma/vim-prisma")
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
    "catppuccin/nvim",
    as = "catppuccin",
  })
  use({
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
    config = [[ require("plugins.lualine")]],
  })
  -- Tools
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
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require("packer").sync()
  end
end)

