return {
    {
        "hrsh7th/nvim-cmp",
        event = { "InsertEnter", "CmdLineEnter" },
        dependencies = {
            {
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-path",
                "hrsh7th/cmp-cmdline",
            },
            {
                "L3MON4D3/LuaSnip",
                version = "v2.*",
                build = "make install_jsregexp",
                dependencies = {
                    "rafamadriz/friendly-snippets",
                    "saadparwaiz1/cmp_luasnip",
                },
            },
            { "onsails/lspkind.nvim" },
            {
                "windwp/nvim-autopairs",
                event = "InsertEnter",
                opts = {},
            },
        },
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
            require("luasnip.loaders.from_vscode").lazy_load({
                paths = { "/home/eeay/src/snippets" },
            })

            local cmp = require("cmp")
            local lspkind = require("lspkind")
            local luasnip = require("luasnip")

            local has_words_before = function()
                unpack = unpack or table.unpack
                local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                return col ~= 0
                    and vim.api
                            .nvim_buf_get_lines(0, line - 1, line, true)[1]
                            :sub(col, col)
                            :match("%s")
                        == nil
            end

            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                view = {
                    entries = {
                        name = "custom",
                        selection_order = "near_cursor",
                    },
                },
                window = {
                    completion = {
                        scrollbar = true,
                    },
                },
                formatting = {
                    format = lspkind.cmp_format({
                        mode = "symbol_text",
                        menu = {
                            buffer = "[B]",
                            nvim_lsp = "[L]",
                            luasnip = "[S]",
                            nvim_lua = "[NL]",
                            dictionary = "[D]",
                        },
                    }),
                },
                experimental = {
                    ghost_text = true,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-down>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-up>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            if luasnip.expandable() then
                                luasnip.expand()
                            else
                                cmp.confirm({
                                    select = true,
                                })
                            end
                        else
                            fallback()
                        end
                    end),
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
                        -- that way you will only jump inside the snippet region
                        elseif luasnip.expand_or_locally_jumpable() then
                            luasnip.expand_or_jump()
                        elseif has_words_before() then
                            cmp.complete()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),

                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "buffer" },
                    { name = "nvim_lsp_signature_help" },
                    { name = "path" },
                    { name = "emoji" },
                    { name = "nerdfont" },
                }),
            })

            cmp.setup.filetype("gitcommit", {
                sources = cmp.config.sources({
                    { name = "git" },
                }, {
                    { name = "buffer" },
                }),
            })

            cmp.setup.cmdline({ "/", "?" }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = "nvim_lsp_document_symbol" },
                    { name = "buffer" },
                },
            })

            cmp.setup.cmdline(":", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = "path" },
                }, {
                    { name = "cmdline" },
                }),
            })

            local cmp_autopairs = require("nvim-autopairs.completion.cmp")
            cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

            cmp.event:on(
                "menu_opened",
                function() vim.b.copilot_suggestion_hidden = true end
            )
            cmp.event:on(
                "menu_closed",
                function() vim.b.copilot_suggestion_hidden = false end
            )
        end,
    },
    {
        "uga-rosa/cmp-dictionary",
        ft = { "markdown", "gitignore", "gitcommit" },
        config = function()
            local cmp = require("cmp")

            cmp.setup({
                formatting = {
                    menu = {
                        dictionary = "[Dict]",
                    },
                },
            })

            cmp.setup.filetype("markdown", {
                sources = require("cmp").config.sources({
                    { name = "path" },
                    { name = "buffer" },
                    {
                        name = "dictionary",
                        keyword_length = 2,
                    },
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "emoji" },
                    { name = "nerdfont" },
                }),
            })

            require("cmp_dictionary").setup({
                paths = { "/usr/share/dict/usa" },
                exact_length = 2,
                first_case_insensitive = true,
                document = {
                    enable = true,
                    command = { "wn", "${label}", "-over" },
                },
            })
        end,
    },
}
