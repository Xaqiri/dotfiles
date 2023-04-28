local keymap = vim.keymap.set
vim.g.mapleader = " "

-- Creates the file under the cursor in the current working directory 
keymap('n', '<leader>mf', '<cmd>:e <cfile>:p<cr>')

-- Use jk to leave insert mode 
keymap('i', 'jk', '<ESC>')
-- Remove highlighting
keymap('n', '<leader>rh', ':nohl<cr>')
-- Highlight all occurrances of string under cursor
keymap('n', '<leader>sh', '#*')
-- Replace all occurrances of string under cursor
keymap('n', '<leader>r', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>', {desc = 'Replace all occurrances of string under cursor'})
-- Toggle directory tree
keymap('n', '<leader>e', '<cmd>Neotree toggle reveal_force_cwd<cr>')
-- Rebinding comment toggles
keymap('n', '<leader>/', '<Plug>(comment_toggle_linewise_current)', {desc = 'Comment current line'})
keymap('x', '<leader>/', '<Plug>(comment_toggle_linewise_visual)gv', {desc = 'Comment block'})
-- Horizontal and vertical split
keymap('n', '<leader>ss', ':split<cr>')
keymap('n', '<leader>sv', ':vsplit<cr>')
keymap('n', '<leader>sx', ':close<cr>')

-- Surround words
-- keymap('n', '<leader>s[', 'viwc[<esc>pa]<esc>')
-- keymap('v', '<leader>s[', 'iwc[<esc>pa]')
-- keymap('x', '<leader>s[', 'iwc[<esc>p')

-- Move between splits
keymap('n', '<leader>j', '<C-w>j', {desc = 'Move to split above'})
keymap('n', '<leader>k', '<C-w>k', {desc = 'Move to split below'})
keymap('n', '<leader>h', '<C-w>h', {desc = 'Move to split left'})
keymap('n', '<leader>l', '<C-w>l', {desc = 'Move to split right'})
-- Make script executable
keymap('n', '<leader>x', '<cmd>silent! !chmod +x %<cr>', {desc = 'Make shell script executable'})
-- Resize splits
keymap('n', '<S-j>', ':resize +2<cr>', {desc = 'Adjust split height'})
keymap('n', '<S-k>', ':resize -2<cr>', {desc = 'Adjust split height'})
keymap('n', '<S-h>', ':vertical resize -2<cr>', {desc = 'Adjust split width'})
keymap('n', '<S-l>', ':vertical resize +2<cr>', {desc = 'Adjust split width'})
keymap('n', '<leader>=', '<C-w>=', {desc = 'Equalize split sizes'})
-- Better indenting
keymap('v', '<', '<gv')
keymap('v', '>', '>gv')
-- Better paste
keymap('v', 'p', '"_dP')
-- Move selected text up and down
keymap('n', '<A-j>', '<Esc>:m .+1<cr>==')
keymap('n', '<A-k>', '<Esc>:m .-2<cr>==')
keymap('i', '<A-j>', '<Esc>:m .+1<cr>==gi')
keymap('i', '<A-k>', '<Esc>:m .-2<cr>==gi')
keymap('x', '<A-j>', ":move '>+1<cr>gv-gv")
keymap('x', '<A-k>', ":move '<-2<cr>gv-gv")
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
keymap('n', '<leader>ff', '<cmd>Telescope find_files hidden=true<cr>', {})
-- Find string in current directory
keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', {})
-- List open buffers
keymap('n', '<leader>fb', '<cmd>Telescope buffers<cr>', {})
-- List help tags
keymap('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', {})
-- Search the current directory for the string under the cursor
keymap('n', '<leader>fs', '<cmd>Telescope grep_string<cr>', {})
-- Look at available color schemes
keymap('n', '<leader>fc', '<cmd>Telescope colorscheme<cr>', {})
-- List keymaps
keymap('n', '<leader>fk', '<cmd>Telescope keymaps<cr>', {})
-- Search lsp
keymap('n', '<leader>fi', '<cmd>Telescope lsp_implementations<cr>', {})
keymap('n', 'gd', '<cmd>Telescope lsp_definitions<cr>', {})
-- keymap('n', 'gd', '<cmd>Telescope lsp_type_definitions<cr>', {})
keymap('n', ']t', '<Plugin>(jump_next())')

