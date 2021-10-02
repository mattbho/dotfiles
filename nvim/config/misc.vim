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
let g:dashboard_custom_header =[
    \'          ▀████▀▄▄              ▄█ ',
    \'            █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█ ',
    \'    ▄        █          ▀▀▀▀▄  ▄▀  ',
    \'   ▄▀ ▀▄      ▀▄              ▀▄▀  ',
    \'  ▄▀    █     █▀   ▄█▀▄      ▄█    ',
    \'  ▀▄     ▀▄  █     ▀██▀     ██▄█   ',
    \'   ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █  ',
    \'    █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀  ',
    \'   █   █  █      ▄▄           ▄▀   ',
    \]
let g:jsx_ext_required = 1
let g:onedark_termcolors=256
let g:onedark_hide_endofbuffer=1
colorscheme onedark
syntax on
filetype plugin indent on
autocmd StdinReadPre * let s:std_in=1
highlight Normal ctermbg=None
highlight LineNr ctermfg=DarkGrey
noremap Y "+y
noremap <silent> gb <cmd>Gitsigns blame_line<CR>
lua <<EOF
require'shade'.setup({
  overlay_opacity = 50,
  opacity_step = 1
})
require('gitsigns').setup()
EOF

