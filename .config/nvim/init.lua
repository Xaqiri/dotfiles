require('config.keymap')
require('config.options')

vim.filetype.add({
    extension = {
        templ = "templ",
    },
})

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
-- require("obsidian").setup()

local lsp = require('lsp-zero').preset('recommended')

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
    vim.keymap.set('n', 'gl', '<End>', { buffer = true })
    vim.keymap.set('n', '<leader>ci', function()
        vim.lsp.buf.code_action({ context = { only = { 'source.organizeImports' } }, apply = true })
    end)
    -- vim.api.nvim_create_autocmd('BufWritePre', {
    --     pattern = '*.go',
    --     callback = function()
    --         vim.lsp.buf.code_action({ context = { only = { 'source.organizeImports' } }, apply = true })
    --     end
    -- })
end)

require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
require('lspconfig').gleam.setup({
    settings = {
        gleam = {
            semanticTokens = true,
        },
    },
})
require('lspconfig').gopls.setup({
    settings = {
        gopls = {
            semanticTokens = true,
        },
    },
})
require('lspconfig').templ.setup({
    settings = {
        templ = {
            semanticTokens = true,
        },
    },
})
require('lspconfig').dartls.setup({
    single_file_support = true,
    cmd = { 'dart', 'language-server', '--protocol=lsp' },
    settings = {
        dartls = {
            semanticTokens = true,
        },
    },
})
require('lspconfig').jdtls.setup({
    settings = {
        jdtls = {
            semanticTokens = true,
        },
    },
})
require('lspconfig').fsautocomplete.setup({
    settings = {
        fsautocomplete = {
            semanticTokens = true,
        },
    },
})
require('lspconfig').sourcekit.setup({
    single_file_support = true,
    -- cmd = { '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/sourcekit-lsp' },
    cmd = { "sourcekit-lsp" },
    settings = {
        sourcekit = {
            semanticTokens = true,
        }
    }
})

lsp.format_on_save({
    format_opts = {
        async = false,
        timeout_ms = 10000,
    },
    servers = {
        ['gleam'] = { 'gleam' },
        ['lua_ls'] = { 'lua' },
        ['gopls'] = { 'go' },
        ['templ'] = { 'templ' },
        ['dartls'] = { 'dart' },
        ['jdtls'] = { 'java' },
        ['swiftformat'] = { 'swift' },
    }
})

lsp.setup()

-- vim.cmd.colorscheme("night-owl")
-- vim.cmd [[colorscheme night-owl]]
-- vim.cmd [[colorscheme kanagawa]]
-- vim.cmd [[colorscheme tokyonight]]
vim.cmd.colorscheme("tokyonight")
local c = require("tokyonight.colors").setup()
vim.api.nvim_set_hl(0, "WinSeparator", { fg = c.blue })
