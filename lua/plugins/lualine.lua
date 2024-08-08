return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    event = "UiEnter",
    config = function()
        require("lualine").setup({
            options = {
                icons_enabled = true,
                theme = "auto",
                component_separators = "",
                section_separators = { left = "", right = "" },
                disabled_filetypes = {
                    statusline = {},
                    winbar = {},
                },
                ignore_focus = {},
                always_divide_middle = true,
                globalstatus = true,
                refresh = {
                    statusline = 1000,
                    tabline = 1000,
                    winbar = 1000,
                },
            },
            sections = {
                lualine_a = {
                    { "mode", separator = { left = "", right = "" }, right_padding = 4, left_padding = 4 },
                },
                lualine_b = { "branch", "diff", "diagnostics" },
                lualine_c = { "filename", { require("auto-session.lib").current_session_name }, "%=", [[datetime]] },
                lualine_x = { "encoding", "fileformat", "filetype" },
                lualine_y = {
                    "progress",
                    function()
                        local ok, pomo = pcall(require, "pomo")
                        if not ok then return "" end

                        local timer = pomo.get_first_to_finish()
                        if timer == nil then return "" end

                        return "󰄉 " .. tostring(timer)
                    end,
                },
                lualine_z = {
                    { "location", separator = { left = "", right = "" }, right_padding = 4, left_padding = 4 },
                },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { "filename" },
                lualine_x = { "location" },
                lualine_y = {},
                lualine_z = {},
            },
            tabline = {},
            winbar = {},
            inactive_winbar = {},
            extensions = {
                "lazy",
                "nvim-dap-ui",
                "trouble",
            },
        })
    end,
}
