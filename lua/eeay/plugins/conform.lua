return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
        {
            "<leader>f",
            function() require("conform").format({ async = true, lsp_fallback = true }) end,
            desc = "Format buffer",
        },
    },
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            c = { "clang-format" },
            rust = { "rustfmt" },
            zig = { "zigfmt " },
            go = { "gofmt" },
            bash = { "shfmt" },
            fish = { "fish_indent" },
            markdown = { "prettier", "cbfmt" },
            python = {"autopep8"},
        },

        formatters = {
            shfmt = {
                prepend_args = { "-i", "2" },
            },
        },
    },
}
