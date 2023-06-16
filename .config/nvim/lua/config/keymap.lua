local keymap = vim.keymap.set
vim.g.mapleader = " "

keymap('n', '<leader>mf', '<cmd>e %:p:h/<cfile><cr>', { desc = 'Creates file under cursor in current directory'})
keymap('n', '<leader>d', '<cmd>lua vim.diagnostic.open_float()<cr>', {desc = 'Line Diagnostics'})
keymap('n', '<leader> m', '<cmd>Mason<cr>')
keymap({ 'n', 'v' }, 'gh', '<HOME>')
keymap({ 'n', 'v' }, 'gl', '<END>')
keymap('i', 'jk', '<ESC>')
keymap('n', '<leader>rh', ':nohl<cr>', { desc = 'Remove highlighting'} )
keymap('n', '<leader>sh', '#*', { desc = 'Highlight all occurrances of string under cursor' })
keymap('n', '<leader>r', ':%s/<C-r><C-w>//gI<Left><Left><Left>', {desc = 'Replace all occurrances of string under cursor'})
keymap('n', '<leader>e', '<cmd>Neotree toggle<cr>')
keymap('n', '<leader> e', '<cmd>Neotree toggle reveal_force_cwd<cr>')
keymap('n', '<leader>/', '<Plug>(comment_toggle_linewise_current)', {desc = 'Comment current line'})
keymap('x', '<leader>/', '<Plug>(comment_toggle_linewise_visual)gv', {desc = 'Comment block'})
keymap('n', '<leader>ss', ':split<cr>')
keymap('n', '<leader>sv', ':vsplit<cr>')
keymap('n', '<leader>sx', ':close<cr>')
keymap('n', '<leader>j', '<C-w>j', {desc = 'Move to split above'})
keymap('n', '<leader>k', '<C-w>k', {desc = 'Move to split below'})
keymap('n', '<leader>h', '<C-w>h', {desc = 'Move to split left'})
keymap('n', '<leader>l', '<C-w>l', {desc = 'Move to split right'})
keymap('n', '<leader>x', '<cmd>silent! !chmod +x %<cr>', {desc = 'Make shell script executable'})
keymap('n', '<leader> <S-j>', ':resize +5<cr>', {desc = 'Increase split height'})
keymap('n', '<leader> <S-k>', ':resize -5<cr>', {desc = 'Decrease split height'})
keymap('n', '<leader> <S-h>', ':vertical resize -2<cr>', {desc = 'Decrease split width'})
keymap('n', '<leader> <S-l>', ':vertical resize +2<cr>', {desc = 'Increase split width'})
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
keymap({'n', 'x'}, 'X', '"_X')

-- Copy current line
keymap({'n', 'x'}, 'yy', ':keepjumps normal! 0v$y<cr>', {desc = 'Copy current line'})
keymap({'n', 'x'}, 'YY', ':keepjumps normal! 0v$"+y<cr>', {desc = 'Copy current line to clipboard'})

-- Select entire document
keymap('n', '<leader>a', ':keepjumps normal! ggVG<cr>', {desc = 'Select entire document'})

-- Open Lazy
keymap('n', '<leader> l', ':Lazy<cr>')

-- Telescope 
-- Find file in current directory
keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', {})
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

keymap('n', '<leader>cf', '<cmd>lua vim.lsp.buf.format({async=true})<cr>', { desc = "Format code in current buffer" })
keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', { desc = "Perform code action" })

-- Command to saving, converting, and opening markdown files
-- vim.api.nvim_create_user_command('MD', 'w | silent !markdown "%" > "%":r.html | open "%":r.html -a Safari', {})
vim.api.nvim_create_user_command('HTMLo',
    'w | silent !pandoc -s "%" -o ~/notes/html/$(basename "%" .md).html --css ~/notes/style.css; sed -i "" "s/.md/.html/g" ~/notes/html/$(basename "%" .md).html | open ~/notes/html/$(basename "%" .md).html -a Safari',
    {})
vim.api.nvim_create_user_command('HTML',
    'w | silent !pandoc -s "%" -o ~/notes/html/$(basename "%" .md).html --css ~/notes/style.css; sed -i "" "s/.md/.html/g" ~/notes/html/$(basename "%" .md).html',
    {})
vim.api.nvim_create_user_command('HTMLtoco',
    'w | silent !pandoc -s --toc "%" -o ~/notes/html/$(basename "%" .md).html --css ~/notes/style.css; sed -i "" "s/.md/.html/g" ~/notes/html/$(basename "%" .md).html | open ~/notes/html/$(basename "%" .md).html -a Safari',
    {})
vim.api.nvim_create_user_command('HTMLtoc',
    'w | silent !pandoc -s --toc "%" -o ~/notes/html/$(basename "%" .md).html --css ~/notes/style.css; sed -i "" "s/.md/.html/g" ~/notes/html/$(basename "%" .md).html',
    {})
