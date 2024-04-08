local v = vim.opt
v.number = false
v.relativenumber = false
v.conceallevel = 2
v.wrap = true
v.linebreak = true
v.tabstop = 2
v.shiftwidth = 2
v.expandtab = true

vim.api.nvim_create_autocmd('BufEnter', {
    pattern = '*.md',
    callback = function()
        vim.cmd("set syntax=markdown")
    end
})
