require('nvim-tree').setup{
  hijack_cursor = true,
  on_attach = function(bufnr)
    local bufmap = function(lhs, rhs, desc)
      vim.keymap.set('n', lhs, rhs, {buffer = bufnr, desc = desc})
    end
    local api = require('nvim-tree.api')
    bufmap('a', api.fs.create, 'Create new file')
    bufmap('dd', api.fs.remove, 'Delete file')
    bufmap('l', api.node.open.edit, 'Expand folder or go to file')
    bufmap('h', api.node.navigate.parent_close, 'Close parent folder')
    bufmap('gh', api.tree.toggle_hidden_filter, 'Toggle hidden files')
  end,
  view = {
    width = 30,
    side = "right",
  },
  update_focused_file = {
    enable = true,
    update_cwd = tre,
  },
  renderer = {
    indent_width = 2,
    indent_markers = {
      enable = true,
      inline_arrows = false,
      icons = {
        corner = "└",
        edge = "│",
        item = "├",
        bottom = "─",
        none = "  ",
      },
    },
    icons = {
      padding = " ",
      show = {
        folder_arrow = false,
      },
    },
  },
}
