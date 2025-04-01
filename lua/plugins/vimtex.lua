return {
  "lervag/vimtex",
  ft = { 'tex', 'plaintex' },
  config = function()
    vim.g.vimtex_view_method = 'zathura_simple'
    vim.g.vimtex_compiler_progname = 'nvr'
    vim.g.tex_flavour = 'xelatex'
  end
}
