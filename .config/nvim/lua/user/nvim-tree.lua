local function width()
  local width = vim.api.nvim_list_uis()[1].width
  return width
end
local function height()
  local height = vim.api.nvim_list_uis()[1].height
  return height
end
require('nvim-tree').setup{
  hijack_cursor = true,
  on_attach = function(bufnr)
    local bufmap = function(lhs, rhs, desc)
      vim.keymap.set('n', lhs, rhs, {buffer = bufnr, desc = desc})
    end
    local api = require('nvim-tree.api')
    bufmap('a', api.fs.create, 'create new file')
    bufmap('dd', api.fs.remove, 'delete file')
    bufmap('l', api.node.open.edit, 'expand folder or go to file')
    bufmap('h', api.node.navigate.parent_close, 'close parent folder')
    bufmap('gh', api.tree.toggle_hidden_filter, 'toggle hidden files')
  end,
  view = {
    width = 30,
    side = "right",
    signcolumn = 'yes',
    -- hide_root_folder = true,
    float = {
      enable = true,
      quit_on_focus_loss = true,
      open_win_config = {
        col = math.floor(width()*0.25),
        row = math.floor(height()*0.15),
        width =  math.floor(width()*0.5),
        height = math.floor(height()*0.6),
        border = "double",
        -- cursor = '',
      },
    },
  },
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  renderer = {
    -- indent_width = 2,
    indent_markers = {
      enable = false,
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
