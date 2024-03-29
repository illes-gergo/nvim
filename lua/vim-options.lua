vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.cmd("set tabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set expandtab")
vim.cmd("set linebreak")
vim.cmd("set scrolloff=10")
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.spell = true
vim.opt.spelllang = { 'en','hu' }
vim.cmd("tnoremap <Esc> <C-\\><C-N>")
