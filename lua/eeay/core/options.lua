vim.opt.autowrite = true
vim.opt.backup = false
vim.opt.clipboard = "unnamedplus"
vim.opt.cmdheight = 1
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.colorcolumn = "120"
vim.opt.conceallevel = 3
vim.opt.confirm = true
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.fillchars = { foldopen = "", foldclose = "", fold = "⸱", foldsep = " ", diff = "╱", eob = " " }
vim.opt.fileencoding = "utf-8"
vim.opt.formatoptions = "jcroqlnt"
vim.opt.grepformat = "%f:%l:%c:%m"
vim.opt.grepprg = "rg --vimgrep"
vim.opt.guifont = "JetBrainsMono Nerd Font:h12"
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.inccommand = "nosplit"
vim.opt.laststatus = 3
vim.opt.linespace = -2
vim.opt.list = true
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.numberwidth = 4
vim.opt.pumblend = 10
vim.opt.pumheight = 12
vim.opt.relativenumber = true
vim.opt.scrolloff = 8
vim.opt.sessionoptions = {
    "blank",
    "buffers",
    "curdir",
    "tabpages",
    "folds",
    "winsize",
    "help",
    "globals",
    "skiprtp",
    "folds",
    "terminal",
    "localoptions",
}
vim.opt.shiftround = true
vim.opt.shiftwidth = 4
vim.opt.shortmess:append({ W = true, I = true, c = true, C = true })
vim.opt.showcmd = false
vim.opt.showmode = false
vim.opt.sidescrolloff = 16
vim.opt.signcolumn = "yes"
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.spelllang = { "en_gb" }
vim.opt.spell = true
vim.opt.splitbelow = true
vim.opt.splitkeep = "screen"
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.tabstop = 4
vim.opt.termguicolors = true
vim.opt.timeoutlen = 300
vim.opt.undofile = true
vim.opt.undolevels = 10000
vim.opt.updatetime = 50
vim.opt.virtualedit = "block"
vim.opt.wildmode = "longest:full,full"
vim.opt.wrap = true

vim.opt.smoothscroll = true
vim.g.markdown_recommended_style = 0

vim.g.netrw_banner = 0
vim.g.netrw_mouse = 2

vim.api.nvim_create_autocmd("FileType", { pattern = "markdown", command = "set awa" })
vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.INFO] = "󰌶",
            [vim.diagnostic.severity.HINT] = "",
        },
    },
    severity_sort = true,
    float = {
        focusable = true,
        style = "minimal",
        border = "none",
        source = "always",
        header = "",
        prefix = "",
    },
})

vim.g.loaded_python3_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
