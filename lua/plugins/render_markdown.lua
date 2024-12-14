return {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = "markdown",
    main = "render-markdown",
    opts = {},
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("render-markdown").setup({
            file_types = { "markdown", "vimwiki" },
            render_modes = true,
            checkbox = {
                custom = {
                    started = {
                        raw = "[/]",
                        rendered = "󰥔 ",
                        highlight = "RenderMarkdownTodo",
                    },
                },
            },
            pipe_table = {
                enabled = true,
                style = "full",
                cell = "raw",
                alignment_indicator = "━",

                -- stylua: ignore start
                border = {
                    '┌', '┬', '┐',
                    '├', '┼', '┤',
                    '└', '┴', '┘',
                    '│', '─',
                },
                -- stylua: ignore stop

                head = "RenderMarkdownTableHead",
                row = "RenderMarkdownTableRow",
                filler = "RenderMarkdownTableFill",
            },
            callout = {
                note = {
                    raw = "[!NOTE]",
                    rendered = "󰋽 Note",
                    highlight = "RenderMarkdownInfo",
                },
                tip = {
                    raw = "[!TIP]",
                    rendered = "󰌶 Tip",
                    highlight = "RenderMarkdownSuccess",
                },
                important = {
                    raw = "[!IMPORTANT]",
                    rendered = "󰅾 Important",
                    highlight = "RenderMarkdownHint",
                },
                warning = {
                    raw = "[!WARNING]",
                    rendered = "󰀪 Warning",
                    highlight = "RenderMarkdownWarn",
                },
                caution = {
                    raw = "[!CAUTION]",
                    rendered = "󰳦 Caution",
                    highlight = "RenderMarkdownError",
                },
                links = {
                    raw = "[!LINKS]",
                    rendered = " Links",
                    highlight = "RenderMarkdownHint",
                },
                -- Obsidian: https://help.a.md/Editing+and+formatting/Callouts
                abstract = {
                    raw = "[!ABSTRACT]",
                    rendered = "󰨸 Abstract",
                    highlight = "RenderMarkdownInfo",
                },
                todo = {
                    raw = "[!TODO]",
                    rendered = "󰗡 Todo",
                    highlight = "RenderMarkdownInfo",
                },
                success = {
                    raw = "[!SUCCESS]",
                    rendered = "󰄬 Success",
                    highlight = "RenderMarkdownSuccess",
                },
                question = {
                    raw = "[!QUESTION]",
                    rendered = "󰘥 Question",
                    highlight = "RenderMarkdownWarn",
                },
                failure = {
                    raw = "[!FAILURE]",
                    rendered = "󰅖 Failure",
                    highlight = "RenderMarkdownError",
                },
                danger = {
                    raw = "[!DANGER]",
                    rendered = "󱐌 Danger",
                    highlight = "RenderMarkdownError",
                },
                bug = {
                    raw = "[!BUG]",
                    rendered = "󰨰 Bug",
                    highlight = "RenderMarkdownError",
                },
                example = {
                    raw = "[!EXAMPLE]",
                    rendered = "󰉹 Example",
                    highlight = "RenderMarkdownHint",
                },
                quote = {
                    raw = "[!QUOTE]",
                    rendered = "󱆨 Quote",
                    highlight = "RenderMarkdownQuote",
                },
            },
        })
    end,
}
