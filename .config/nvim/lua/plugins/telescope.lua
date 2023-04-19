return {
  "nvim-telescope/telescope.nvim",
  'nvim-telescope/telescope-fzf-native.nvim', build = ':make',
  cmd = "Telescope",
  version = false, -- telescope did only one release, so use HEAD for now
  opts = {
    pickers = {
      find_files = {
        -- theme = 'dropdown',
        layout_strategy = 'vertical',
        -- layout_config={width=0.75, height=0.8}
      },
      buffers = {
        theme = 'dropdown'
      },
      grep_string = {
        theme = 'cursor',
        layout_config={width=0.8, height=0.25}
      },
    }
  },
  config = function(_, opts)
    require('telescope').setup(opts)
    require('telescope').load_extension('fzf')
  end,
}
