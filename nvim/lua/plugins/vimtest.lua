local nmap = require("utils").nmap
local g = vim.g

g["test#strategy"] = "vimux"
g.VimuxOrientation = "v"
g.VimuxHeight = 20

nmap("<leader>T", "<cmd>TestNearest<CR>")
nmap("<leader>t", "<cmd>TestFile<CR>")
nmap("<leader>a", "<cmd>TestSuite<CR>")
nmap("<leader>l", "<cmd>TestLast<CR>")
