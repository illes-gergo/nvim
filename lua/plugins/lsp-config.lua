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
        ensure_installed = { "julials", "clangd", "clang-format", "findent" , "fortls" , "bashls" },

--     bash-language-server bashls
--     clang-format
--     clangd
--     cpplint
--     findent
--     fortls
--     julia-lsp julials
--     lua-language-server lua_ls
      })
    end,
  },
  -- NVim LSP-Config
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      capabilities.offsetEncoding = { "utf-16" }
      local lspconfig = require("lspconfig")
      lspconfig.julials.setup({
        capabilities = capabilities,
      })
      lspconfig.bashls.setup({
        capabilities = capabilities,
      })
      lspconfig.fortls.setup({
        capabilities = capabilities,
        cmd = {
          'fortls',
          '--lowercase_intrinsics',
          '--hover_signature',
          '--hover_language=fortran',
          '--use_signature_help',
          '--autocomplete_no_snippets',
          '--autocomplete_name_only',
          '--enable_code_actions',
        }
      })
      lspconfig.clangd.setup({
        capabilities = {
          offsetEncoding = "utf-16",
        },
        init_options = {
          usePlaceholders = false,
        },
      })
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, {})
    end,
  },
}
