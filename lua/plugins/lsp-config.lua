return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  -- Mason LSP-Config
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { bashls },
      })
    end,
  },
  -- NVim LSP-Config
  {
    "neovim/nvim-lspconfig",
        keys = {
          { "<leader>ch", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C/C++)" },
          { "<leader>si", "<cmd>ClangdShowSymbolInfo<cr>", desc = "Show symbol info (C/C++)" },
        },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")
      lspconfig.bashls.setup({
        capabilities = capabilities,
      })
 --     lspconfig.lua_ls.setup({
 --       capabilities = capabilities,
 --     })
 --     lspconfig.julials.setup({
 --       capabilities = capabilities,
 --     })
 --     lspconfig.fortls.setup({
 --       capabilities = capabilities,
 --       cmd = {
 --         'fortls',
 --         '--lowercase_intrinsics',
 --         '--hover_signature',
 --         '--hover_language=fortran',
 --         '--use_signature_help',
 --         '--autocomplete_no_snippets',
 --         '--autocomplete_name_only',
 --         '--enable_code_actions',
 --       }
 --     })
 --     lspconfig.clangd.setup({
 --       capabilities = {
 --         offsetEncoding = "utf-16",
 --       },
 --       init_options = {
 --         usePlaceholders = false,
 --       },
 --     })
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, {})
    end,
  },
}
