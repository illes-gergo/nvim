return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")

		config.setup({
			ensure_installed = { "julia", "cpp", "lua", "latex" },
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
