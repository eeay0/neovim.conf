return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = false,
    config = function()
        require("catppuccin").setup({
            flavour = "mocha", -- latte, frappe, macchiato, mocha
            background = { -- :h background
                light = "latte",
                dark = "mocha",
            },
            transparent_background = false, -- disables setting the background color.
            show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
            term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
            dim_inactive = {
                enabled = false, -- dims the background color of inactive window
                shade = "dark",
                percentage = 0.15, -- percentage of the shade to apply to the inactive window
            },
            no_italic = false, -- Force no italic
            no_bold = false, -- Force no bold
            no_underline = false, -- Force no underline
            styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
                comments = { "italic" }, -- Change the style of comments
                conditionals = { "italic", "bold" },
                loops = { "italic", "bold" },
                functions = { "bold" },
                keywords = { "italic" },
                strings = { "italic" },
                variables = {},
                numbers = {},
                booleans = { "bold" },
                properties = {},
                types = { "bold" },
                operators = {},
                -- miscs = {}, -- Uncomment to turn off hard-coded styles
            },
            color_overrides = {
                mocha = {
                    rosewater = "#ffada9",
                    flamingo = "#ff8686",
                    pink = "#ff73c3",
                    mauve = "#d784f9",
                    red = "#DC143C",
                    maroon = "#e45768",
                    peach = "#f9a04f",
                    yellow = "#f9c645",
                    green = "#7ed982",
                    teal = "#4fd7b1",
                    sky = "#30d5c8",
                    sapphire = "#1a8fbd",
                    blue = "#66b3ff",
                    lavender = "#a366ff", -- Bright magenta to replace lavender
                    text = "#e6e6e6",
                    subtext1 = "#e6e6e6",
                    subtext0 = "#cccccc",
                    overlay2 = "#b3b3b3",
                    overlay1 = "#999999",
                    overlay0 = "#808080",
                    base = "#0d0d0d",
                    mantle = "#1a1a1a",
                    crust = "#262626",
                },
            },
            custom_highlights = {},
            integrations = {
                cmp = true,
                gitsigns = true,
                treesitter = true,
                noice = true,
                harpoon = true,
                indent_blankline = {
                    enabled = true,
                    scope_color = "",
                    colored_indent_levels = true,
                },
                rainbow_delimiters = true,
                telescope = {
                    enabled = true,
                    -- style = "nvchad",
                },
                lsp_trouble = true,
                illuminate = {
                    enabled = true,
                    lsp = true,
                },
                native_lsp = {
                    enabled = true,
                    virtual_text = {
                        errors = { "italic" },
                        hints = { "italic" },
                        warnings = { "italic" },
                        information = { "italic" },
                    },
                    underlines = {
                        errors = { "underline" },
                        hints = { "underline" },
                        warnings = { "underline" },
                        information = { "underline" },
                    },
                    inlay_hints = {
                        background = true,
                    },
                    treesitter_context = true,
                },
            },
        })
        vim.cmd.colorscheme("catppuccin")
    end,
}
