return {
  'terrortylor/nvim-comment',
  config = function()
    require('nvim_comment').setup {
      line_mapping = '<leader>c<leader>',
      operator_mapping = '<leader><leader>c',
    }
  end,
}
