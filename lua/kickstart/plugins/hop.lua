return {
  'smoka7/hop.nvim',
  version = '*',
  opts = {
    keys = 'etovxqpdygfblzhckisuran',
  },
  config = function()
    -- From https://dev.to/kquirapas/neovim-on-steroids-vim-sneak-easymotion-hopnvim-4k17
    require('hop').setup()

    -- normal mode (easymotion-like)
    vim.api.nvim_set_keymap('n', '<Leader><Leader>b', '<cmd>HopWordBC<CR>', { noremap = true })
    vim.api.nvim_set_keymap('n', '<Leader><Leader>w', '<cmd>HopWordAC<CR>', { noremap = true })
    vim.api.nvim_set_keymap('n', '<Leader><Leader>j', '<cmd>HopLineAC<CR>', { noremap = true })
    vim.api.nvim_set_keymap('n', '<Leader><Leader>k', '<cmd>HopLineBC<CR>', { noremap = true })

    -- visual mode (easymotion-like)
    vim.api.nvim_set_keymap('v', '<Leader><Leader>w', '<cmd>HopWordAC<CR>', { noremap = true })
    vim.api.nvim_set_keymap('v', '<Leader><Leader>b', '<cmd>HopWordBC<CR>', { noremap = true })
    vim.api.nvim_set_keymap('v', '<Leader><Leader>j', '<cmd>HopLineAC<CR>', { noremap = true })
    vim.api.nvim_set_keymap('v', '<Leader><Leader>k', '<cmd>HopLineBC<CR>', { noremap = true })

    -- normal mode (sneak-like)
    -- vim.api.nvim_set_keymap('n', 's', '<cmd>HopChar2AC<CR>', { noremap = false })
    -- vim.api.nvim_set_keymap('n', 'S', '<cmd>HopChar2BC<CR>', { noremap = false })

    -- visual mode (sneak-like)
    -- vim.api.nvim_set_keymap('v', 's', '<cmd>HopChar2AC<CR>', { noremap = false })
    -- vim.api.nvim_set_keymap('v', 'S', '<cmd>HopChar2BC<CR>', { noremap = false })
  end,
}
