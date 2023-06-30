return {
    "nvim-telescope/telescope.nvim",
    -- 'nvim-telescope/telescope-fzf-native.nvim', build = ':make',
    cmd = "Telescope",
    version = false, -- telescope did only one release, so use HEAD for now
    opts = {
        file_ignore_patterns = {
            'node%_modules/.*',
            '.git',
        },
        defaults = {
            borderchars = { "═", "║", "═", "║", "╔", "╗", "╝", "╚" },
            mappings = {
                n = {
                    ['bd'] = "delete_buffer"
                },
            },
        },
        pickers = {
            find_files = {
                find_command = { 'fd', '-L', '-t', 'f', '.' },
                file_ignore_patterns = {
                    'node_modules',
                    '.git',
                },
                -- layout_config={width=0.75, height=0.8},
            },
            grep_string = {
                theme = 'cursor',
                layout_config = { width = 0.8, height = 0.4 },
                borderchars = { "═", "║", "═", "║", "╔", "╗", "╝", "╚" },
            },
            buffers = {
                theme = 'ivy',
            },
        },
        -- extensions = {
        --   fzf = {
        --     fuzzy = true,
        --     override_generic_sorter = true,
        --     override_file_sorter = true,
        --     case_mode = 'smart_case',
        --   },
        -- },
    },
    config = function(_, opts)
        require('telescope').setup(opts)
        -- require('telescope').load_extension('fzf')
    end,
}
