-- Core options for koompi.nvim

local opt = vim.opt

-- General
opt.clipboard = "unnamedplus"
opt.mouse = "a"
opt.undofile = true
opt.updatetime = 250
opt.timeoutlen = 300

-- UI
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.wrap = true          -- Enable text wrapping
opt.linebreak = true     -- Break at word boundaries
opt.showbreak = "↪ "     -- Wrapped line indicator
opt.cursorline = true
opt.termguicolors = true
opt.pumheight = 10
opt.laststatus = 3       -- Global statusline

-- Indentation
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2
opt.smartindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true

-- Splits
opt.splitbelow = true
opt.splitright = true

-- Performance
opt.lazyredraw = true
opt.synmaxcol = 240

-- Disable some built-ins
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1