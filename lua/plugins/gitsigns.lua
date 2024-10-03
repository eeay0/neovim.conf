return {
    "lewis6991/gitsigns.nvim",
    event = { "BufRead", "BufNewFile" },
    config = function()
        require("gitsigns").setup({
            signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
            numhl = true, -- Toggle with `:Gitsigns toggle_numhl`
            linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
            word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
            auto_attach = true,
            preview_config = {
                border = "none",
                style = "minimal",
                relative = "cursor",
                row = 0,
                col = 1,
            },
        })
    end,
}
