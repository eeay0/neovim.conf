return {
    "rmagatti/auto-session",
    lazy = false,
    config = function()
        require("auto-session").setup({
            log_level = "error",
            auto_session_suppress_dirs = { "~/", "~/src", "Downloads", "/", "~/.config" },
            auto_save_enabled = true,
            session_lens = {
                -- If load_on_setup is set to false, one needs to eventually call  if they want to use session-lens.
                buftypes_to_ignore = {}, -- list of buffer types what should not be deleted from current session
                load_on_setup = false,
                theme_conf = { border = true },
                previewer = false,
            },
        })
        require("auto-session").setup_session_lens()
        vim.keymap.set("n", "<leader>fs", require("auto-session.session-lens").search_session, { noremap = true })
    end,
}
