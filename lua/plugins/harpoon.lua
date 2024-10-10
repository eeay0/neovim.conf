return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "UiEnter",
    config = function()
        local harpoon = require("harpoon")
        harpoon:setup({
            settings = {
                save_on_toggle = true,
                sync_on_ui_close = true,
                key = function() return vim.loop.cwd() end,
            },
        })
        local map = vim.keymap.set

        map("n", "<leader>a", function() harpoon:list():add() end)
        map(
            "n",
            "<C-e>",
            function() harpoon.ui:toggle_quick_menu(harpoon:list()) end
        )

        map("n", "<A-1>", function() harpoon:list():select(1) end)
        map("n", "<A-2>", function() harpoon:list():select(2) end)
        map("n", "<A-3>", function() harpoon:list():select(3) end)
        map("n", "<A-4>", function() harpoon:list():select(4) end)
        map("n", "<A-5>", function() harpoon:list():select(5) end)
        map("n", "<A-6>", function() harpoon:list():select(6) end)

        -- Toggle previous & next buffers stored within Harpoon list
        map("n", "<C-S-P>", function() harpoon:list():prev() end)
        map("n", "<C-S-N>", function() harpoon:list():next() end)
    end,
}
