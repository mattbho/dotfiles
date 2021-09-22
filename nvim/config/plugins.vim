call plug#begin('~/.vim/plugged')
Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/dashboard-nvim'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'antoinemadec/coc-fzf'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'vim-test/vim-test'
Plug 'preservim/vimux'
Plug 'christoomey/vim-tmux-navigator'
Plug 'simeji/winresizer'
Plug 'sunjon/shade.nvim'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'navarasu/onedark.nvim'
Plug 'tpope/vim-jdaddy', { 'for': 'json' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'ibhagwan/fzf-lua'
Plug 'vijaymarupudi/nvim-fzf'
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-mix-format'
Plug 'tpope/vim-commentary'
Plug 'dense-analysis/ale'
Plug 'elixir-editors/vim-elixir'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'windwp/nvim-ts-autotag'
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'NTBBloodbath/galaxyline.nvim'
call plug#end()
