return {
	"nvimtools/none-ls.nvim",
	dependencies = { "nvimtools/none-ls-extras.nvim" },
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
---				null_ls.builtins.formatting.stylua,
---				null_ls.builtins.formatting.clang_format,
---				require("none-ls.diagnostics.cpplint"),
---				require("none-ls.formatting.latexindent"),
---       null_ls.builtins.formatting.findent,
---	     	null_ls.builtins.diagnostics.vale,
			},
			debug = true,
		})
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
