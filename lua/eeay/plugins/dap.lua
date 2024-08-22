return {
    {
        "mfussenegger/nvim-dap",
        event = "UiEnter",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "theHamsta/nvim-dap-virtual-text",
            "nvim-neotest/nvim-nio",
        },
        config = function()
            require("dapui").setup()
            require("nvim-dap-virtual-text").setup({
                highlight_changed_variables = true,
                highlight_new_as_changed = true,
                show_stop_reason = true,
                commented = false,
                only_first_definition = true,
                all_references = true,
                clear_on_continue = false,
                virt_text_pos = "inline",
            })

            vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "", linehl = "", numhl = "" })

            local dap, dapui, map = require("dap"), require("dapui"), vim.keymap.set
            dap.listeners.before.attach.dapui_config = function() dapui.open() end
            dap.listeners.before.launch.dapui_config = function() dapui.open() end
            dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
            dap.listeners.before.event_exited.dapui_config = function() dapui.close() end

            map("n", "<F5>", function() require("dap").continue() end)
            map("n", "<F6>", function() require("dap").step_over() end)
            map("n", "<F7>", function() require("dap").step_into() end)
            map("n", "<F8>", function() require("dap").step_out() end)
            map("n", "<Leader>b", function() require("dap").toggle_breakpoint() end)

            dap.adapters.gdb = {
                type = "executable",
                command = "gdb",
                args = { "-i", "dap" },
            }
            dap.configurations.c = {
                {
                    name = "Launch",
                    type = "gdb",
                    request = "launch",
                    program = function() return vim.fn.input("/bin/gdb", vim.fn.getcwd() .. "/", "file") end,
                    cwd = "${workspaceFolder}",
                    stopAtBeginningOfMainSubprogram = false,
                },
            }

            dap.configurations.cpp = dap.configurations.c
            dap.configurations.cpp = dap.configurations.rust
        end,
    },
}
