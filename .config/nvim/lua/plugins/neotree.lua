return {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v2.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons',
        'MunifTanjim/nui.nvim',
    },
    opts = {
        close_if_last_window = true,
        popup_border_style = 'double',
        enable_git_status = true,
        window = {
            position = 'float',
            width = '80%',
            popup = {
                size = {
                    height = '75%',
                    width = '80%',
                },
            },
            mappings = {
                ['/'] = 'noop',
                ['l'] = 'open',
                ['<leader>l'] = 'set_root',
                ['h'] = 'close_node',
                ['<leader>h'] = 'navigate_up',
            },
        },
    },
    config = function(_, opts)
        require('neo-tree').setup(opts)
        vim.cmd([[highlight! link NeoTreeFloatBorder FloatBorder]])
    end,
}
