return {
  'folke/which-key.nvim',
  opts = {
    window = {
      border = 'double',
    },
  },
  config = function(_, opts)
      local presets = require("which-key.plugins.presets")
      presets.operators["v"] = nil
      require('which-key').setup(opts)
  end,
}
