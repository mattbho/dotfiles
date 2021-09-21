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
" let g:ale_fix_on_save = 1
let g:mix_format_on_save = 1
let g:onedark_termcolors=256
let g:onedark_hide_endofbuffer=1
colorscheme onedark
syntax on
filetype plugin indent on
autocmd StdinReadPre * let s:std_in=1
highlight Normal ctermbg=None
highlight LineNr ctermfg=DarkGrey
noremap Y "+y
lua <<EOF
require'shade'.setup({
  overlay_opacity = 50,
  opacity_step = 1
})
EOF

