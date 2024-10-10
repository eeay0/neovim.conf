return {
    "folke/trouble.nvim",
    opts = {},
    cmd = "Trouble",
    keys = {
        { "<leader>tt", "<cmd> Trouble diagnostics toggle <cr>" },
        { "<leader>td", "<cmd> TodoTrouble <CR>" },
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
}
