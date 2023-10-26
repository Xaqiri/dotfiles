return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
        icons_enabled = true,
        theme = "auto",
        component_separators = { left = '', right = '' },
        -- component_separators = { left = '│', right = '│' },
        section_separators = { left = '', right = '' },
        sections = {
            -- lualine_a = {
            --     { 'mode', separator = { right = '' }, right_padding = 2 },
            -- },
            lualine_a = { { 'filename', separator = { right = '' }, right_padding = 2 }, },
            lualine_b = {},
            lualine_c = { 'branch', 'diff', 'diagnostics' },
            lualine_x = {},
            lualine_y = {
                { 'datetime', separator = { left = '' }, style = '%H:%M' },
                { 'filetype', separator = '' },
            },
            lualine_z = {
                { 'progress', separator = { left = '' }, left_padding = 2, colored = false },
                { 'location' },
            },
        },
        inactive_sections = {
            -- lualine_a = { 'filename' },
            lualine_a = {},
            lualine_b = {},
            lualine_c = {},
            lualine_x = {},
            lualine_y = {},
            lualine_z = {},
        },
        -- tabline = {
        -- lualine_a = { { 'buffers', separator = { right = '' }, right_padding = 2 }, },
        -- lualine_z = { { 'datetime', separator = { left = '' }, left_padding = 2, colored = false }, },
        -- },
        extensions = {},
    },
    config = function(_, opts)
        require('lualine').setup(opts)
    end,
}
