vim.g.copilot_no_tab_map = true

return {
  'supermaven-inc/supermaven-nvim',
  config = function()
    require('supermaven-nvim').setup {}
  end,
}
