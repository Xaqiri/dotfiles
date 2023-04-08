local lazy = {} 

function lazy.install(path)
  if not vim.loop.fs_stat(path) then
    print('Installing lazy.nvim...')
    vim.fn.system({
      'git',
      'clone',
      '--filter=blob:none',
      'https://github.com/folke/lazy.nvim.git',
      '--branch=stable', -- latest stable release
      path,
    })
  end
end

function lazy.setup(plugins)
  lazy.install(lazy.path)
  vim.opt.rtp:prepend(lazy.path)
  require('lazy').setup(plugins, lazy.opts)
end

lazy.path = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
lazy.opts = {}

lazy.setup({
  {'nvim-lua/plenary.nvim'},
  {'catppuccin/nvim', name = 'catppuccin'},
  {'decaycs/decay.nvim', name = 'decay'},
  {'nvim-lualine/lualine.nvim'},
  {'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'},
  {'nvim-tree/nvim-web-devicons'},
  {'nvim-tree/nvim-tree.lua'},
  {'numToStr/Comment.nvim'},
  {'akinsho/toggleterm.nvim'},
  {'windwp/nvim-autopairs'},
  {'lukas-reineke/indent-blankline.nvim'},
  {'williamboman/mason.nvim', build = ':MasonUpdate'},
  {'williamboman/mason-lspconfig.nvim'},
  {'neovim/nvim-lspconfig'},
})


