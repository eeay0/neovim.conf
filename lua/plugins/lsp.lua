return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "smjonas/inc-rename.nvim",
        "folke/neodev.nvim",
    },
    event = { "BufRead", "BufNewFile" },
    config = function()
        local lspconfig = require("lspconfig")
        local variables = require("utils.variables")
        local map = vim.keymap.set
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        capabilities.offsetEncoding = "utf-8"

        require("neodev").setup({ library = { plugins = { "nvim-dap-ui" }, types = true } })
        require("inc_rename").setup({})

        require("lspconfig").bashls.setup({})
        require("lspconfig").zls.setup({})

        for _, opts in pairs(variables.Ft_Opts) do
            if opts.lsp then
                if opts.lsp.conf then
                    lspconfig[opts.lsp.lsp].setup(opts.lsp.conf)
                    lspconfig[opts.lsp.lsp].setup({ capabilities = capabilities })
                else
                    lspconfig[opts.lsp.lsp].setup({})
                    lspconfig[opts.lsp.lsp].setup({ capabilities = capabilities })
                end
            end
        end

        require("lspconfig").fish_lsp.setup({})
        -- Read https://neovim.io/doc/user/lsp.html to get more information.
        local opts = { noremap = true, silent = true }
        map("n", "gD", vim.lsp.buf.declaration, opts)
        map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        map("n", "gd", vim.lsp.buf.definition, opts)
        map("n", "K", vim.lsp.buf.hover, opts)
        map("n", "gi", vim.lsp.buf.implementation, opts)
        --        map('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        map("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
        map("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
        map("n", "<space>wl", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)
        map("n", "<space>D", vim.lsp.buf.type_definition, opts)
        --map('n', '<space>rn', vim.lsp.buf.rename, opts)
        map("n", "<space>rn", ": IncRename ", opts)
        --        map("n", "<space>f", vim.lsp.buf.format, opts)
        map("n", "gr", vim.lsp.buf.references, opts)
        map("n", "<space>e", vim.diagnostic.open_float, opts)
        map("n", "[d", vim.diagnostic.goto_prev, opts)
        map("n", "]d", vim.diagnostic.goto_next, opts)
        map("n", "<space>q", vim.diagnostic.setloclist, opts)
    end,
}
