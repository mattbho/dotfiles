local set = vim.opt
local cmd = vim.cmd
local o = vim.o
local wo = vim.wo

vim.g.did_load_filetypes = 1
o.termguicolors = true
wo.wrap = false
set.ignorecase = true
set.smartcase = true
set.autoindent = true
set.smartindent = true
set.expandtab = true
set.tabstop = 2
set.softtabstop = 2
set.shiftwidth = 2
set.compatible = false
set.shell= "zsh"
set.number = true
set.ruler = true
set.wildmenu = true
set.wildmode= {"list", "longest", "full"}
set.errorbells = false
set.visualbell = true
set.incsearch = true
set.confirm = true
set.swapfile = false
set.encoding = "utf-8"
set.hidden = true
set.backup = false
set.writebackup = false
set.cmdheight = 2
set.updatetime = 300
set.shortmess = "atToOFc"
set.signcolumn = "yes"
set.hlsearch = false

cmd [[syntax on]]
cmd [[filetype plugin indent on]]
cmd [[highlight LineNr ctermbg=NONE guibg=NONE]]
cmd [[highlight NonText ctermfg=19 guifg=#333333]]
cmd [[autocmd StdinReadPre * let s:std_in=1]]