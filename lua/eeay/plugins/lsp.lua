return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "smjonas/inc-rename.nvim",
        "folke/neodev.nvim",
    },
    event = { "BufRead", "BufNewFile" },
    config = function()
        local opts = { buffer = bufnr, noremap = true, silent = true }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<space>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
        vim.keymap.set('n', '[d', vim.diagnostic.get_prev, opts)
        vim.keymap.set('n', ']d', vim.diagnostic.get_next, opts)
        vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
        vim.keymap.set('n', '<space>f', vim.lsp.buf.format, opts)

        --- SERVERS
        local lsp = require("lspconfig")



        local map = vim.keymap.set
        -- local capabilities = require("cmp_nvim_lsp").default_capabilities()
        -- capabilities.offsetEncoding = "utf-8"

        require("neodev").setup({ library = { plugins = { "nvim-dap-ui" }, types = true } })
        require("inc_rename").setup({})

        lsp.lua_ls.setup({})
    end
}
