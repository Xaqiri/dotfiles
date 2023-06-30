require('config.keymap')
require('config.options')

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

require("lazy").setup('plugins', {})

local lsp = require('lsp-zero').preset('recommended')

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
    vim.keymap.set('n', 'gl', '<End>', { buffer = true })
end)

require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.format_on_save({
    format_opts = {
        async = false,
        timeout_ms = 10000,
    },
    servers = {
        ['lua_ls'] = { 'lua' },
    }
})

lsp.setup()

-- vim.cmd.colorscheme("night-owl")
-- vim.cmd [[colorscheme night-owl]]
-- vim.cmd [[colorscheme kanagawa]]
-- vim.cmd [[colorscheme tokyonight]]
vim.cmd.colorscheme("tokyonight")
