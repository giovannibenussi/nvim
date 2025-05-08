-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim
--
-- Shortcuts:
-- Shift + F to toggle Neo-tree width

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
    '3rd/image.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '\\', ':Neotree reveal<CR>', { desc = 'NeoTree reveal' } },
    { '<C-n>', ':Neotree reveal<CR>', { desc = 'NeoTree reveal' } },
  },
  opts = {
    filesystem = {
      window = {
        width = 30,
        mappings = {
          ['\\'] = 'close_window',
          ['<C-n>'] = 'close_window',
          -- Go to parent node. From: https://github.com/nvim-neo-tree/neo-tree.nvim/issues/531#issuecomment-1252232165
          ['p'] = function(state)
            local node = state.tree:get_node()
            require('neo-tree.ui.renderer').focus_node(state, node:get_parent_id())
          end,
          ['P'] = { 'toggle_preview', config = { use_float = true, use_image_nvim = true } },
          ['o'] = 'system_open',
        },
      },
    },
    event_handlers = {
      {
        event = 'file_opened',
        handler = function(file_path)
          -- auto close
          -- vimc.cmd("Neotree close")
          -- OR
          require('neo-tree.command').execute { action = 'close' }
        end,
      },
    },
    -- From: https://github.com/nvim-neo-tree/neo-tree.nvim/wiki/Recipes#open-with-system-viewer
    commands = {
      system_open = function(state)
        local node = state.tree:get_node()
        local path = node:get_id()
        -- macOs: open file in default application in the background.
        vim.fn.jobstart({ 'open', '-g', path }, { detach = true })
      end,
    },
  },
  config = function(_, opts)
    require('neo-tree').setup(opts)

    -- Add Shift+A to toggle Neo-tree width when in Neo-tree buffer
    local neo_tree_width = 80
    local neo_tree_toggle_width = function()
      local win = vim.api.nvim_get_current_win()
      local current_width = vim.api.nvim_win_get_width(win)
      vim.notify('Current width: ' .. current_width, vim.log.levels.INFO)
      if current_width < neo_tree_width then
        vim.cmd('vertical resize ' .. neo_tree_width)
      else
        vim.cmd 'vertical resize 30'
      end
    end

    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'neo-tree',
      callback = function()
        vim.keymap.set('n', '<S-F>', neo_tree_toggle_width, {
          buffer = true,
          desc = 'Toggle Neo-tree Width',
        })
      end,
    })
  end,
}
