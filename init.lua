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

function unload_treesitter()
	local lazy_module = require('lazy')
	print("Lazy module:", lazy_module) -- Add this line
	if lazy_module then
		print("Lazy module unload function:", lazy_module.unload) -- Add this line
		if lazy_module.unload then
			lazy_module.unload({ "nvim-treesitter" })
			vim.notify("Treesitter unloaded.")
		else
			vim.notify("lazy.unload() is nil.")
		end
	else
		vim.notify("Error: Lazy module is nil!")
	end
end

-- Create a command
vim.api.nvim_create_user_command('UnloadTreesitter', unload_treesitter, {})
