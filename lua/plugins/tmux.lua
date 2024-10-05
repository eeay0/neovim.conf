return {
    "christoomey/vim-tmux-navigator",
    lazf = false,
    cmd = {
        "TmuxNavigateLeft",
        "TmuxNavigateDown",
        "TmuxNavigateUp",
        "TmuxNavigateRight",
        "TmuxNavigatePrevious",
    },
    keys = {
        { "<A-h>", "<cmd>TmuxNavigateLeft<cr>" },
        { "<A-j>", "<cmd>TmuxNavigateDown<cr>" },
        { "<A-k>", "<cmd>TmuxNavigateUp<cr>" },
        { "<A-l>", "<cmd>TmuxNavigateRight<cr>" },
        { "<A-left>", "<cmd>TmuxNavigateLeft<cr>" },
        { "<A-down>", "<cmd>TmuxNavigateDown<cr>" },
        { "<A-up>", "<cmd>TmuxNavigateUp<cr>" },
        { "<A-right>", "<cmd>TmuxNavigateRight<cr>" },
        { "<A-\\>", "<cmd>TmuxNavigatePrevious<cr>" },
    },
}
