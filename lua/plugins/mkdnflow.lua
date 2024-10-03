return {
    "jakewvincent/mkdnflow.nvim",
    ft = { "markdown" },
    config = function()
        require("mkdnflow").setup({
            modules = {
                yaml = true,
                cmp = true,
            },
            perspective = {
                priority = "root",
                fallback = "current",
                root_tell = "main.md",
                nvim_wd_heel = false,
                update = false,
            },
            wrap = false,
            silent = false,
            -- learn what is that
            new_file_template = {
                use_template = false,
                placeholders = {
                    before = {
                        title = "link_title",
                        date = "os_date",
                    },
                    after = {},
                },
                template = "# {{ title }}",
            },
            to_do = {
                symbols = { " ", "/", "X" },
                update_parents = true,
                not_started = " ",
                in_progress = "/",
                complete = "X",
            },
            foldtext = {
                title_transformer = function()
                    local function my_title_transformer(text)
                        local updated_title = text:gsub("%b{}", "")
                        updated_title = updated_title:gsub("^%s*", "")
                        updated_title = updated_title:gsub("%s*$", "")
                        updated_title =
                            updated_title:gsub("^######", "░░░░░▓")
                        updated_title =
                            updated_title:gsub("^#####", "░░░░▓▓")
                        updated_title =
                            updated_title:gsub("^####", "░░░▓▓▓")
                        updated_title =
                            updated_title:gsub("^###", "░░▓▓▓▓")
                        updated_title =
                            updated_title:gsub("^##", "░▓▓▓▓▓")
                        updated_title =
                            updated_title:gsub("^#", "▓▓▓▓▓▓")
                        return updated_title
                    end
                    return my_title_transformer
                end,
                object_count_icon_set = "nerdfont", -- Use/fall back on the nerdfont icon set
                object_count_opts = function()
                    local opts = {
                        link = false, -- Prevent links from being counted
                        blockquote = { -- Count block quotes (these aren't counted by default)
                            icon = " ",
                            count_method = {
                                pattern = { "^>.+$" },
                                tally = "blocks",
                            },
                        },
                        fncblk = {
                            -- Override the icon for fenced code blocks with 
                            icon = " ",
                        },
                    }
                    return opts
                end,
                line_count = true, -- Prevent lines from being counted
                word_count = true, -- Count the words in the section
                fill_chars = {
                    left_edge = "╾─ ─",
                    right_edge = "──╼",
                    item_separator = " · ",
                    section_separator = " // ",
                    left_inside = " ┝",
                    right_inside = "┥ ",
                    middle = "─",
                },
            },
            tables = {
                trim_whitespace = true,
                format_on_move = true,
                auto_extend_rows = true,
                auto_extend_cols = true,
                style = {
                    cell_padding = 1,
                    separator_padding = 1,
                    outer_pipes = true,
                    mimic_alignment = true,
                },
            },
            mappings = {
                MkdnEnter = { { "n", "v" }, "<CR>" },
                MkdnTab = false,
                MkdnSTab = false,
                MkdnNextLink = { "n", "<Tab>" },
                MkdnPrevLink = { "n", "<S-Tab>" },
                MkdnNextHeading = { "n", "]]" },
                MkdnPrevHeading = { "n", "[[" },
                MkdnGoBack = { "n", "<BS>" },
                MkdnGoForward = { "n", "<Del>" },
                MkdnCreateLink = false, -- see MkdnEnter
                MkdnCreateLinkFromClipboard = { { "n", "v" }, "<leader>p" }, -- see MkdnEnter
                MkdnFollowLink = false, -- see MkdnEnter
                MkdnDestroyLink = { "n", "<M-CR>" },
                MkdnTagSpan = { "v", "<M-CR>" },
                MkdnMoveSource = { "n", "<F2>" },
                MkdnYankAnchorLink = { "n", "yaa" },
                MkdnYankFileAnchorLink = { "n", "yfa" },
                MkdnIncreaseHeading = { "n", "+" },
                MkdnDecreaseHeading = { "n", "-" },
                MkdnToggleToDo = { { "n", "v" }, "<C-Space>" },
                MkdnNewListItem = false,
                MkdnNewListItemBelowInsert = { "n", "o" },
                MkdnNewListItemAboveInsert = { "n", "O" },
                MkdnExtendList = false,
                MkdnUpdateNumbering = { "n", "<leader>nn" },
                MkdnTableNextCell = { "i", "<Tab>" },
                MkdnTablePrevCell = { "i", "<S-Tab>" },
                MkdnTableNextRow = { "i", "<M-S-CR>" },
                MkdnTablePrevRow = { "i", "<M-CR>" },
                MkdnTableNewRowBelow = { "n", "<leader>ir" },
                MkdnTableNewRowAbove = { "n", "<leader>iR" },
                MkdnTableNewColAfter = { "n", "<leader>ic" },
                MkdnTableNewColBefore = { "n", "<leader>iC" },
                MkdnFoldSection = { "n", "<leader>ff" },
                MkdnUnfoldSection = { "n", "<leader>F" },
            },
        })
    end,
}
