return {
    "mfussenegger/nvim-lint",
    event = { "BufWrite", "BufWritePost" },
    config = function()
        require("lint").linters_by_ft = {
            lua = { "luacheck" },
            bash = { "shellcheck" },
            fish = { "fish" },
            python = { "pylint" },
        }

        vim.api.nvim_create_autocmd({ "BufWritePost" }, {
            callback = function()
                require("lint").try_lint()
                -- require("lint").try_lint("cspell")
            end,
        })
    end,
}
