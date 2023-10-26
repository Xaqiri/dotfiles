return {
    "jose-elias-alvarez/null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim", "mason.nvim" },
    config = function()
        local nls = require("null-ls")
        nls.setup({ sources = { nls.builtins.formatting.mdformat, } })
    end
}
