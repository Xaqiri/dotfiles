return {
    "folke/noice.nvim",
    event = "VeryLazy",
    enabled = false,
    opts = {
        views = {
            cmdline_popup = {
                position = {
                    row = "25%",
                    col = "50%",
                },
                size = {
                    min_width = 40,
                },
                border = {
                    style = "double",
                },
            },
        },
        cmdline = {
            view = "cmdline",
        },
        lsp = {
            override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = false,
                ["vim.lsp.util.stylize_markdown"] = false,
                ["cmp.entry.get_documentation"] = false,
            }
        },
        presets = {
            bottom_search = true,
            command_palette = true,
            long_message_to_split = false,
            lsp_doc_border = true,
        },
    },
    dependencies = {
        "MunifTanjim/nui.nvim",
    },
    -- config = function (_, opts)
    -- require("noice").setup(opts)
    -- end
}
