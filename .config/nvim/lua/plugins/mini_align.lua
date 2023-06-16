return {
    'echasnovski/mini.align',
    version = '*',
    opts = {},
    config = function (_, opts)
        require('mini.align').setup(opts)
    end
}
