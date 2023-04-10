vim.cmd 'set whichwrap+=h,l'
vim.cmd [[set iskeyword+=-]]
local augroup = vim.api.nvim_create_augroup('user_cmds', {clear = true})
local function open_nvim_tree(data)
  local directory = vim.fn.isdirectory(data.file) == 1

  if not directory then
    return
  end
  vim.cmd.cd(data.file)
  require('nvim-tree.api').tree.open()
end

vim.api.nvim_create_autocmd('BufEnter', {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and require('nvim-tree.utils').is_nvim_tree_buf() then
      vim.cmd 'quit'
    end
  end
})

vim.api.nvim_create_autocmd({ 'VimEnter' }, { callback = open_nvim_tree }) 

vim.api.nvim_create_autocmd('TextYankPost', {
  group = augroup,
  desc = 'Highlight on yank',
  callback = function(event)
    vim.highlight.on_yank({higroup = 'Visual', timeout = 200})
  end
})

