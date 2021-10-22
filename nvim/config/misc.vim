lua <<EOF
require('gitsigns').setup()
local onedarkpro = require('onedarkpro')
onedarkpro.setup({
  colors = {
    bg = '#282c34'
  }
})
onedarkpro.load()
EOF
set nowrap
set ignorecase
set smartcase
set autoindent
set smartindent
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set nocompatible              
set rtp+=/usr/local/opt/fzf
set shell=/bin/zsh
set number
set termguicolors
set ruler
set wildmenu
set wildmode=list:longest,full
set noerrorbells                     
set visualbell                        
set hlsearch
set incsearch
set confirm
set noswapfile
set encoding=utf-8
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes

filetype off                 
let g:dashboard_default_executive ='telescope'
let g:dashboard_custom_header = [
\ ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
\ ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
\ ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
\ ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
\ ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
\ ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
\]
lua <<EOF
local g = vim.g
g.dashboard_session_directory = '~/.config/nvim/.sessions'g.dashboard_custom_section = {
    a = {description = {"  Find File                "}, command = "Telescope find_files"},
    b = {description = {"  Recents                  "}, command = "Telescope oldfiles"},
    c = {description = {"  Find Word                "}, command = "Telescope live_grep"},
    d = {description = {"  New File                 "}, command = "DashboardNewFile"},
    g = {description = {"  Update Plugins           "}, command = "PlugUpdate"},
    h = {description = {"  Settings                 "}, command = "edit $MYVIMRC"},
    i = {description = {"  Exit                     "}, command = "exit"}
    }
EOF
syntax on
filetype plugin indent on
hi LineNr ctermbg=NONE guibg=NONE 
hi NonText guifg=bg
autocmd StdinReadPre * let s:std_in=1
noremap Y "+y
noremap <silent> gb <cmd>Gitsigns blame_line<CR>
