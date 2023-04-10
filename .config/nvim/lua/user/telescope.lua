require('telescope').setup{
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
}

require('telescope').load_extension('fzf')
