local bubbles = {
section_separators = { left = '', right = '' },
sections = {
    lualine_a = {
      { 'mode', separator = { left = '' }, right_padding = 2 },
    },
    lualine_b = { 'filename', 'branch' },
    lualine_c = { 'fileformat' },
    lualine_x = {},
    lualine_y = { 'filetype', 'progress' },
    lualine_z = {
      { 'location', separator = { right = '' }, left_padding = 2 },
    },
  },
  inactive_sections = {
    lualine_a = { 'filename' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'location' },
  },
  tabline = {},
  extensions = {},
}

return {
  'nvim-lualine/lualine.nvim',
  opts = {
    icons_enabled = true,
    theme = 'auto',
    -- section_separators = { left = '', right = ''},
    component_separators = '│',
    section_separators = { left = '', right = '' },
    },
  config = function(_, opts)
    require('lualine').setup({
      options = opts,
      sections = bubbles.sections,
    })
  end,
}
