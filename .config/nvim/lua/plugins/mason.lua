return {
  'williamboman/mason.nvim',
  config = function()
    require('mason').setup({
      ui = {
        border = 'double'
      }
    })
  end,
}
