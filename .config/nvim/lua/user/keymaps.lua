local keymap = vim.keymap.set
vim.g.mapleader = " "

-- Bind jk to get back into normal mode easier
keymap('i', 'jk', '<ESC>')
-- Remove highlighting
keymap('n', '<leader>h', ':nohl<cr>')
-- Toggle directory tree
keymap('n', '<leader>e', ':NvimTreeToggle<cr>')
-- Open Lazy plugin manager
keymap('n', '<leader>l', ':Lazy<cr>')
-- Rebinding comment toggles
keymap('n', '<leader>/', '<Plug>(comment_toggle_linewise_current)')
keymap('x', '<leader>/', '<Plug>(comment_toggle_linewise_visual)gv')
-- Horizontal and vertical split
keymap('n', '<leader>ss', ':split<cr>') 
keymap('n', '<leader>sv', ':vsplit<cr>') 
keymap('n', '<leader>sx', ':close<cr>') 
-- Move between splits
keymap('n', '<C-j>', '<C-w>j')
keymap('n', '<C-k>', '<C-w>k')
keymap('n', '<C-h>', '<C-w>h')
keymap('n', '<C-l>', '<C-w>l')
-- Resize splits
keymap('n', '<S-j>', ':resize +2<cr>')
keymap('n', '<S-k>', ':resize -2<cr>')
keymap('n', '<S-h>', ':vertical resize -2<cr>')
keymap('n', '<S-l>', ':vertical resize +2<cr>')
-- Better indenting
keymap('v', '<', '<gv')
keymap('v', '>', '>gv')
-- Better paste
keymap('v', 'p', '"_dP')
-- Move selected text up and down
keymap('v', '<C-j>', ':m +1<cr>gv-gv')
keymap('v', '<C-k>', ':m -2<cr>gv-gv')
keymap('x', 'J', ":move '>+1<cr>gv-gv")
keymap('x', 'K', ":move '>-2<cr>gv-gv")
-- Copy and paste from clipboard
keymap({'n', 'x'}, 'cp', '"+y')
keymap({'n', 'x'}, 'cv', '"+p')
-- Delete character without replacing anything that's copied
keymap({'n', 'x'}, 'x', '"_x')
-- Select entire document
keymap('n', '<leader>a', ':keepjumps normal! ggVG<cr>')

