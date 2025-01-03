return {
  "ray-x/lsp_signature.nvim",
  event = "VeryLazy",
  opts = {},
  config = function(_, opts)
    require("lsp_signature").setup(opts)
    vim.keymap.set({ "n", "i" }, "<C-k>", function() vim.lsp.buf.signature_help() end, {})
  end,
}
