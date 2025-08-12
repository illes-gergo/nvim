return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  -- Mason LSP-Config
  {
    "neovim/nvim-lspconfig",
        keys = {
          { "<leader>ch", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C/C++)" },
          { "<leader>si", "<cmd>ClangdShowSymbolInfo<cr>", desc = "Show symbol info (C/C++)" },
          { "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename symbol" },
        },
    lazy = false,
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")
      lspconfig.julials.setup({
        capabilities = capabilities,
      })
      lspconfig.bashls.setup({
        capabilities = capabilities,
      })
      lspconfig.pylsp.setup({
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
        },
      })
      lspconfig.clangd.setup({
        capabilities = {
          offsetEncoding = { "utf-16" },
        },
        init_options = {
          usePlaceholders = false,
          completeUnimported = true,
          clangdFileStatus = true,
        },
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
          "--header-insertion=iwyu",
          "--completion-style=detailed",
          "--function-arg-placeholders",
          "--query-driver=g++",
          "--fallback-style=llvm",
        },
        root_dir = function(fname)
          return require("lspconfig.util").root_pattern(
            "Makefile",
            "configure.ac",
            "configure.in",
            "config.h.in",
            "meson.build",
            "meson_options.txt",
            "build.ninja"
          )(fname) or require("lspconfig.util").root_pattern("compile_commands.json", "compile_flags.txt")(
              fname
            ) or require("lspconfig.util").find_git_ancestor(fname)
        end,
      })
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, {})
    end,
  },
}
