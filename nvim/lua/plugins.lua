local fn = vim.fn
local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
end

require("packer").startup(function(use)
  -- Manage self
  use "wbthomason/packer.nvim"
  -- LSP
  use {
    "neovim/nvim-lspconfig",
     config = [[ require("plugins.lsp") ]]
  }
  use "jose-elias-alvarez/null-ls.nvim"
  -- Completion
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
      "onsails/lspkind-nvim"
    },
    config = [[ require("plugins.completion") ]]
  }
  --Navigation
  use {
    "kyazdani42/nvim-tree.lua",
     config = [[ require("plugins.nvim-tree") ]]
  }
  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      "nvim-lua/plenary.nvim"
    },
    config = [[ require("plugins.telescope") ]]
  }
  use {"nvim-telescope/telescope-fzf-native.nvim", run = "make" }
  use {
    "glepnir/dashboard-nvim",
    config = [[ require("plugins.dashboard") ]]
  }
  --Syntax
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    requires = {
        "windwp/nvim-ts-autotag",
        "p00f/nvim-ts-rainbow",
    },
    config = [[ require("plugins/treesitter") ]]
  }
  use "elixir-editors/vim-elixir"
  -- Git
  use {
    "lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" },
    config = function() require("gitsigns").setup() end
  }
  use {
    "TimUntersberger/neogit",
    requires = "nvim-lua/plenary.nvim",
    config = function () require("neogit").setup() end
  }
  -- Theme
  use {
    "olimorris/onedarkpro.nvim",
    config = [[ require("plugins.onedark")]]
  }
  use {
    "NTBBloodbath/galaxyline.nvim",
    requires = {"kyazdani42/nvim-web-devicons", opt = true},
    config = [[ require("plugins.galaxyline")]]
  }
  -- Tools
  use "b3nj5m1n/kommentary"
  use {
    "vim-test/vim-test",
    config = [[ require("plugins.vimtest")]]
  }
  use "christoomey/vim-tmux-navigator"
  use "nathom/filetype.nvim"
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require("packer").sync()
  end
end)
