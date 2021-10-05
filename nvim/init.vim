set runtimepath^=~/.vim runtimepath+=~/.vim/after
    let &packpath = &runtimepath

source ~/.config/nvim/config/plugins.vim
source ~/.config/nvim/config/misc.vim
source ~/.config/nvim/config/lsp.lua
" source ~/.config/nvim/config/fzf.vim
source ~/.config/nvim/config/galaxyline.lua
source ~/.config/nvim/config/nvim-tree.vim
source ~/.config/nvim/config/telescope.vim
source ~/.config/nvim/config/treesitter.lua
source ~/.config/nvim/config/vimtest.vim
