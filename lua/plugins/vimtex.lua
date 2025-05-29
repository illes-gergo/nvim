return {
  "lervag/vimtex",
  ft = { 'tex', 'plaintex' },
  config = function()
    vim.g.vimtex_view_method = 'zathura_simple'
    vim.g.vimtex_tex_flavour = 'xelatex'
  end
}
