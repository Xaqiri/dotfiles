return {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    opts = {
        style = 'night',
        transparent = true,
        styles = {
            sidebars = 'transparent',
            floats = 'transparent',
            functions = { italic = false },
        },
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
