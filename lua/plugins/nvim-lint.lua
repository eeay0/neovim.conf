return {
    "mfussenegger/nvim-lint",
    event = "UiEnter",
    config = function()
        require("lint").linters_by_ft = {
            c = { "clangtidy" },
            lua = { "luacheck" },
        }
        vim.api.nvim_create_autocmd({ "BufWritePost" }, {
            callback = function()
                require("lint").try_lint()
                require("lint").try_lint("cspell")
            end,
        })
    end,
}
