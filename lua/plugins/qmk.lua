return {
    "codethread/qmk.nvim",
    cmd = "QMKFormat",
    config = function()
        require("qmk").setup({
            name = "LAYOUT_split_3x5_3",
            layout = {
                "x x x x x _ _ _ _ _ _ x x x x x",
                "x x x x x _ _ _ _ _ _ x x x x x",
                "x x x x x _ _ _ _ _ _ x x x x x",
                "_ _ _ _ x x x _ _ x x x _ _ _ _",
            },
            comment_preview = {
                position = "inside",
                keymap_overrides = {
                    QK_BOOT = "boot", -- replace any long key codes
                },
            },
        })
    end,
}
