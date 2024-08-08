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
            fish = { "fish_indent" },
            python = { "autopep8" },
            shell = { "beautysh" },
            sh = { "beautysh" },
            zsh = { "beautysh" },
            markdown = { "prettier", "cbfmt" },
        },

        formatters = {
            shfmt = {
                prepend_args = { "-i", "2" },
            },
        },
    },
}
