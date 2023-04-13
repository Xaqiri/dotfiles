return {
  'folke/which-key.nvim',
  opts = {
    window = {
      border = 'double',
    },
  },
  config = function(_, opts)
    require('which-key').setup(opts)
  end,
}
