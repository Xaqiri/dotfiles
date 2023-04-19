local keymap = vim.keymap.set
local telescope = require('telescope.builtin')
vim.g.mapleader = " "

-- Bind jk to get back into normal mode easier
keymap('i', 'jk', '<ESC>')
-- Remove highlighting
keymap('n', '<leader>sh', ':nohl<cr>')
-- Toggle directory tree
keymap('n', '<leader>e', ':NvimTreeToggle<cr>')
-- Open Lazy plugin manager
keymap('n', '<leader>l', ':Lazy<cr>')
-- Rebinding comment toggles
keymap('n', '<leader>/', '<Plug>(comment_toggle_linewise_current)', {desc = 'Comment current line'})
keymap('x', '<leader>/', '<Plug>(comment_toggle_linewise_visual)gv', {desc = 'Comment block'})
-- Horizontal and vertical split
keymap('n', '<leader>ss', ':split<cr>')
keymap('n', '<leader>sv', ':vsplit<cr>')
keymap('n', '<leader>sx', ':close<cr>')
-- Move between splits
keymap('n', '<leader>j', '<C-w>j', {desc = 'Move to split above'})
keymap('n', '<leader>k', '<C-w>k', {desc = 'Move to split below'})
keymap('n', '<leader>h', '<C-w>h', {desc = 'Move to split left'})
keymap('n', '<leader>l', '<C-w>l', {desc = 'Move to split right'})
-- Resize splits
keymap('n', '<S-j>', ':resize +2<cr>')
keymap('n', '<S-k>', ':resize -2<cr>')
keymap('n', '<S-h>', ':vertical resize -2<cr>')
keymap('n', '<S-l>', ':vertical resize +2<cr>')
keymap('n', '<leader>=', '<C-w>=', {desc = 'Equalize split sizes'})
-- Better indenting
keymap('v', '<', '<gv')
keymap('v', '>', '>gv')
-- Better paste
keymap('v', 'p', '"_dP')
-- Move selected text up and down
keymap('n', '<C-j>', '<Esc>:m .+1<cr>==')
keymap('n', '<C-k>', '<Esc>:m .-2<cr>==')
keymap('i', '<C-j>', '<Esc>:m .+1<cr>==gi')
keymap('i', '<C-k>', '<Esc>:m .-2<cr>==gi')
keymap('x', '<C-j>', ":move '>+1<cr>gv-gv")
keymap('x', '<C-k>', ":move '<-2<cr>gv-gv")
-- Copy and paste from clipboard
keymap({'n', 'x'}, '<leader>y', '"+y')
keymap({'n', 'x'}, '<leader>p', '"+p')
-- Delete character without replacing anything that's copied
keymap({'n', 'x'}, 'x', '"_x')
-- Copy current line
keymap('n', 'yy', ':keepjumps normal! 0v$y<cr>', {desc = 'Copy current line'})
-- Select entire document
keymap('n', '<leader>a', ':keepjumps normal! ggVG<cr>', {desc = 'Select entire document'})

-- Open Lazy
keymap('n', '<leader> l', ':Lazy<cr>')

-- Telescope 
-- Find file in current directory
keymap('n', '<leader>ff', telescope.find_files, {})
-- Find string in current directory
keymap('n', '<leader>fg', telescope.live_grep, {})
-- List open buffers
keymap('n', '<leader>fb', telescope.buffers, {})
-- List help tags
keymap('n', '<leader>fh', telescope.help_tags, {})
-- Search the current directory for the string under the cursor
keymap('n', '<leader>fs', telescope.grep_string, {})
-- Look at available color schemes
keymap('n', '<leader>fc', telescope.colorscheme, {})
-- List keymaps
keymap('n', '<leader>fk', telescope.keymaps, {})
-- Search lsp
keymap('n', '<leader>fi', telescope.lsp_implementations, {})
keymap('n', '<leader>fd', telescope.lsp_definitions, {})
keymap('n', '<leader>ft', telescope.lsp_type_definitions, {})
keymap('n', ']t', '<Plugin>(jump_next())')
