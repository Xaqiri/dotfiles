return {
    'akinsho/toggleterm.nvim',
    version = '*',
    opts = {
        open_mapping = [[<c-/>]],
        direction = 'float',
        float_opts = {
            border = 'double',
            width = function()
                return math.floor(vim.o.columns * 0.8)
            end,
            height = function()
                return math.floor(vim.o.lines * 0.75)
            end,
        },
        highlights = {
            FloatBorder = {
                guifg = '#7aa2f7',
            }
        },
    },
    config = function(_, opts)
        require("toggleterm").setup(opts)
    end
}
