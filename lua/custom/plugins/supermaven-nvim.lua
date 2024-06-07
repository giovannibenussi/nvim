vim.g.copilot_no_tab_map = true

return {
  'supermaven-inc/supermaven-nvim',
  config = function()
    require('supermaven-nvim').setup {
      color = {
        suggestion_color = '#15803d',
        cterm = 244,
      },
    }
  end,
}
