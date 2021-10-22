call plug#begin('~/.vim/plugged')
Plug 'glepnir/dashboard-nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'jose-elias-alvarez/null-ls.nvim'
" Completion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'L3MON4D3/LuaSnip'
Plug 'onsails/lspkind-nvim'
" Syntax
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'windwp/nvim-ts-autotag'
Plug 'elixir-editors/vim-elixir'
" File Navigation
Plug 'nvim-telescope/telescope.nvim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
" Theming
Plug 'tpope/vim-commentary'
Plug 'olimorris/onedarkpro.nvim'
Plug 'NTBBloodbath/galaxyline.nvim'
Plug 'kyazdani42/nvim-web-devicons' " for file icons
" Tools
Plug 'vim-test/vim-test'
Plug 'preservim/vimux'
Plug 'christoomey/vim-tmux-navigator'
Plug 'simeji/winresizer'
Plug 'lewis6991/gitsigns.nvim'   
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
call plug#end()
