return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "smjonas/inc-rename.nvim",
        "folke/neodev.nvim",
        "williamboman/mason.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        "nvim-java/nvim-java",
        "mfussenegger/nvim-lint",
        "stevearc/conform.nvim",
        "mfussenegger/nvim-dap",
        "rcarriga/nvim-dap-ui",
        "theHamsta/nvim-dap-virtual-text",
    },
    init = function() end,
    event = { "BufRead", "BufNewFile" },
    config = function()
        require("mason").setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
            max_concurrent_installers = 8,
        })

        require("mason-tool-installer").setup({
            ensure_installed = {
                -- C
                "clangd",
                "clang-format",
                "codelldb",
                "cpplint",
                -- Assembly
                "asm-lsp",
                "asmfmt",
                -- Java
                "jdtls",
                "google-java-format",
                "checkstyle",
                -- C#
                "csharp-language-server",
                "netcoredbg",
                "csharpier",
                -- Python
                "pyright",
                "debugpy",
                "black",
                "flake8",
                -- SQL
                "sqls",
                "sqlfluff",
                "sql-formatter",
                -- Markdown
                "remark-language-server",
                "remark-cli",
                "prettier",
                -- Bash
                "bash-language-server",
                "bash-debug-adapter",
                "shellcheck",
                "beautysh",
                -- Powershell
                "powershell-editor-services",
                -- Lua
                "lua-language-server",
                "stylua",
                "luacheck",
            },
        })
        require("java").setup()
        local opts = { buffer = bufnr, noremap = true, silent = true }
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        -- vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
        vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set(
            "n",
            "<space>wr",
            vim.lsp.buf.remove_workspace_folder,
            opts
        )
        vim.keymap.set(
            "n",
            "<space>wl",
            function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
            opts
        )
        vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
        -- vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
        vim.keymap.set("n", "[d", vim.diagnostic.get_prev, opts)
        vim.keymap.set("n", "]d", vim.diagnostic.get_next, opts)
        vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)
        -- vim.keymap.set('n', '<space>f', vim.lsp.buf.format, opts)

        local lsp = require("lspconfig")
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        capabilities.offsetEncoding = "utf-8"

        require("neodev").setup({
            library = { plugins = { "nvim-dap-ui" }, types = true },
        })
        require("inc_rename").setup({})
        vim.keymap.set("n", "<space>rn", ": IncRename ", opts)

        --- SERVERS
        lsp.lua_ls.setup({ capabilities = capabilities })
        lsp.fish_lsp.setup({ capabilities = capabilities })
        lsp.clangd.setup({ capabilities = capabilities })
        lsp.asm_lsp.setup({ capabilities = capabilities })
        lsp.jdtls.setup({
            capabilities = capabilities,
            settings = {
                java = {
                    configuration = {
                        runtimes = {
                            {
                                name = "JavaSE-21",
                                path = "lib/jvm/java-21-openjdk",
                                default = true,
                            },
                        },
                    },
                },
            },
        })
        lsp.csharp_ls.setup({ capabilities = capabilities })
        lsp.pyright.setup({ capabilities = capabilities })
        lsp.sqls.setup({ capabilities = capabilities })
        lsp.remark_ls.setup({ capabilities = capabilities })
        lsp.bashls.setup({ capabilities = capabilities })
        lsp.powershell_es.setup({ capabilities = capabilities })

        -- formatter
        require("conform").setup({
            formatters_by_ft = {
                c = { "clang-format" },
                asm = { "asmfmt" },
                java = { "google-java-format" },
                cs = { "csharpier" },
                lua = { "stylua" },
                bash = { "shfmt" },
                fish = { "fish_indent" },
                markdown = { "prettier", "cbfmt" },
                python = { "black" },
                sql = { "sql_formatter" },
            },

            formatters = {
                shfmt = {
                    prepend_args = { "-i", "2" },
                },
            },
        })

        vim.keymap.set(
            "n",
            "<leader>f",
            function()
                require("conform").format({ async = true, lsp_fallback = true })
            end
        )
        -- linter
        require("lint").linters_by_ft = {
            lua = { "luacheck" },
            bash = { "shellcheck" },
            fish = { "fish" },
            python = { "flake8" },
            c = { "cpplint" },
            java = { "checkstyle" },
            sql = { "sqlfluff" },
        }

        vim.api.nvim_create_autocmd({ "BufWritePost" }, {
            callback = function()
                require("lint").try_lint()
                -- require("lint").try_lint("cspell")
            end,
        })

        -- Debug
    end,
}
