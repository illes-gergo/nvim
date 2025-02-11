local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local opts = {}

require("vim-options")
require("lazy").setup("plugins")

vim.keymap.set("n","<C-S-Right>", ":wincmd l<CR>", {})
vim.keymap.set("n","<C-S-Left>", ":wincmd h<CR>", {})
vim.keymap.set("n","<C-S-Up>",":wincmd k<CR>", {})
vim.keymap.set("n","<C-S-Down>",":wincmd j<CR>" , {})

vim.keymap.set("n","<M-C-Right>", ":wincmd l<CR>", {})
vim.keymap.set("n","<M-C-Left>", ":wincmd h<CR>", {})
vim.keymap.set("n","<M-C-Up>",":wincmd k<CR>", {})
vim.keymap.set("n","<M-C-Down>",":wincmd j<CR>" , {})
