local v = vim.opt

v.tabstop = 4
v.shiftwidth = 4

vim.api.nvim_create_autocmd('BufEnter', {
    pattern = '*.swift',
    callback = function()
        vim.cmd("set syntax=swift")
    end
})

vim.api.nvim_create_autocmd('BufWritePost', {
    pattern = '*.swift',
    callback = function()
        vim.cmd('silent !swiftformat %')
    end,
})
