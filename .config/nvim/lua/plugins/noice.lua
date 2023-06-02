return {
    "folke/noice.nvim",
    event = "VeryLazy",
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
            view = "cmdline_popup",
        },
        presets = {
            bottom_search = true,
            command_palette = true,
            long_message_to_split = true,
            lsp_doc_border = true,
        },
    },
    dependencies = {
        "MunifTanjim/nui.nvim",
    },
}
