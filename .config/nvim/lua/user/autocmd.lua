vim.cmd 'set whichwrap+=h,l'
vim.cmd [[set iskeyword+=-]]
local function open_nvim_tree(data)
  local directory = vim.fn.isdirectory(data.file) == 1

  if not directory then
    return
  end
  vim.cmd.cd(data.file)
  require('nvim-tree.api').tree.open()
end


vim.api.nvim_create_autocmd({ 'VimEnter' }, { callback = open_nvim_tree }) 

vim.api.nvim_create_autocmd('TextYankPost', {
  group = augroup,
  desc = 'Highlight on yank',
  callback = function(event)
    vim.highlight.on_yank({higroup = 'Visual', timeout = 200})
  end
})

