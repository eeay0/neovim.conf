return {
    "rmagatti/auto-session",
    lazy = false,
    config = function()
        require("auto-session").setup({
            log_level = "error",
            suppress_dirs = { "~/", "~/src", "downloads", "/", "~/.config", "~/downloads" },
            auto_restore_last_session = true,
            session_lens = {
                buftypes_to_ignore = {}, -- list of buffer types what should not be deleted from current session
                load_on_setup = false,
                theme_conf = { border = true },
                previewer = false,
            },
        })
        vim.keymap.set("n", "<leader>fs", require("auto-session.session-lens").search_session, { noremap = true })
    end,
}
