return {
  'nvim-neo-tree/neo-tree.nvim',
    branch = 'v2.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  opts = {
    close_if_last_window = true,
    popup_border_style = 'double',
    enable_git_status = true,
    window = {
      position = 'float',
      width = '30%',
      popup = {
        size = {
          height = '50%',
          width = '30%',
        },
      },
      mappings = {
        ['/'] = 'noop',
        ['l'] = 'open',
        ['h'] = 'close_node',
      },
    },
  },
  config = function(_, opts)
    require('neo-tree').setup(opts)
  end,
  }
