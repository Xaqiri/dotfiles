return {
    'folke/tokyonight.nvim',
    lazy = true,
    priority = 1000,
    opts = {
        style = 'storm',
        transparent = true,
        terminal_colors = true,
        styles = {
            sidebars = 'transparent',
            floats = 'transparent',
            functions = { italic = true },
            comments = { italic = true },
        },
        on_colors = function(colors)
            colors.comment = colors.comment
        end,
        on_highlights = function(hl, c)
            hl.TelescopeBorder = {
                fg = c.blue,
            }
            hl.TelescopeTitle = {
                fg = c.fg,
            }
            hl.FloatBorder = {
                fg = c.blue,
            }
            hl.NoiceCmdlinePopupBorder = {
                fg = c.blue,
            }
            hl.NoiceCmdlinePopupTitle = {
                fg = c.fg,
            }
            hl.NeotreeFloatTitle = {
                fg = c.fg,
            }
        end,
    },
    config = function(_, opts)
        require('tokyonight').setup(opts)
        -- vim.cmd [[colorscheme tokyonight]]
    end,
}
