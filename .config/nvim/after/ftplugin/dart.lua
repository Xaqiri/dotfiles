local v = vim.opt

v.tabstop = 2
v.shiftwidth = 2

vim.api.nvim_create_autocmd('BufEnter', {
    pattern = '*.dart',
    callback = function()
        vim.cmd("set syntax=dart")
    end
})
