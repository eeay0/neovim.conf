return {
    {
        "numToStr/Comment.nvim",
        event = { "BufRead", "BufNewFile" },
        config = function()
            require("Comment").setup({
                padding = true,
                sticky = true,
                toggler = { line = "gcc", block = "gbc" },
                opleader = { line = "gc", block = "gb" },
                extra = { above = "gcO", below = "gco", eol = "gcA" },
            })
        end,
    },
    {
        "folke/todo-comments.nvim",
        event = "UiEnter",
        config = function()
            require("todo-comments").setup({
                signs = true,
                sign_priority = 8,
                keywords = {
                    FIX = {
                        icon = "󱁤",
                        color = "error",
                        alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
                    },
                    TODO = { icon = "", color = "info" },
                    WARN = {
                        icon = "",
                        color = "warning",
                        alt = { "WARNING" },
                    },
                    PERF = {
                        icon = "",
                        color = "default",
                        alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" },
                    },
                    NOTE = { icon = "", color = "hint", alt = { "INFO" } },
                    TEST = {
                        icon = "󰤑",
                        color = "test",
                        alt = { "TESTING", "PASSED", "FAILED" },
                    },
                },
                gui_style = {
                    fg = "NONE", -- The gui style to use for the fg highlight group.
                    bg = "BOLD", -- The gui style to use for the bg highlight group.
                },
                merge_keywords = true, -- when true, custom keywords will be merged with the defaults
                -- highlighting of the line containing the todo comment
                -- * before: highlights before the keyword (typically comment characters)
                -- * keyword: highlights of the keyword
                -- * after: highlights after the keyword (todo text)
                highlight = {
                    multiline = true, -- enable multine todo comments
                    multiline_pattern = "^.", -- lua pattern to match the next multiline from the start of the matched keyword
                    multiline_context = 10, -- extra lines that will be re-evaluated when changing a line
                    before = "", -- "fg" or "bg" or empty
                    keyword = "wide", -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
                    after = "fg", -- "fg" or "bg" or empty
                    pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlighting (vim regex)
                    comments_only = true, -- uses treesitter to match keywords in comments only
                    max_line_len = 400, -- ignore lines longer than this
                    exclude = {}, -- list of file types to exclude highlighting
                },
                -- list of named colors where we try to extract the guifg from the
                -- list of highlight groups or use the hex color if hl not found as a fallback
                colors = {
                    error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
                    warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
                    info = { "DiagnosticInfo", "#2563EB" },
                    hint = { "DiagnosticHint", "#10B981" },
                    default = { "Identifier", "#7C3AED" },
                    test = { "Identifier", "#FF00FF" },
                },
                search = {
                    command = "rg",
                    args = {
                        "--color=never",
                        "--no-heading",
                        "--with-filename",
                        "--line-number",
                        "--column",
                    },
                    pattern = [[\b(KEYWORDS):]], -- ripgrep regex
                },
            })
        end,
        map = vim.keymap.set,
    },
}
