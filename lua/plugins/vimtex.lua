return {
 "lervag/vimtex",
  ft = {'tex','plaintex'},
  config = function ()
    vim.g.vimtex_view_method = 'zathura'
    vim.g.vimtex_compiler_merthod = 'latexrun'
  end
}
