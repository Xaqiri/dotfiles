require('config.keymap')
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local opt = require('config.options')
require("lazy").setup('plugins', opts)

local lsp = require('lsp-zero').preset('recommended')

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
    vim.keymap.set('n', 'gl', '<End>', { buffer = true })
end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()
require("noice").setup({
    lsp = {
        override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = false,
            ["vim.lsp.util.stylize_markdown"] = false,
            ["cmp.entry.get_documentation"] = false,
        }
    },
    presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        lsp_doc_border = true,
    },
})

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
