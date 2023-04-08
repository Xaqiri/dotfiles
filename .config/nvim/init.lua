local load = function(mod)
  package.loaded[mod] = nil
  require(mod)
end
load('user.plugins')
load('user.colorscheme')
load('user.lualine')
load('user.nvim-tree')
load('user.toggleterm')
load('user.autocmd')
load('user.options')
load('user.keymaps')
load('user.comment')
load('user.autopairs')
load('user.indent')
load('user.treesitter')
load('user.mason')
-- load('user.lsp')

local augroup = vim.api.nvim_create_augroup('user_cmds', {clear = true})


