-- Core Neovim options - koompi.nvim
-- Inspired by NvChad with modern defaults

local opt = vim.opt
local g = vim.g

-- Disable some builtin vim plugins
local disabled_built_ins = {
  "2html_plugin",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logipat",
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "matchit",
  "tar",
  "tarPlugin",
  "rrhelper",
  "spellfile_plugin",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin",
  "tutor",
  "rplugin",
  "syntax",
  "synmenu",
  "optwin",
  "compiler",
  "bugreport",
  "ftplugin",
}

for _, plugin in pairs(disabled_built_ins) do
  g["loaded_" .. plugin] = 1
end

-- General settings
opt.mouse = "a" -- Enable mouse support
opt.clipboard = "unnamedplus" -- Use system clipboard
opt.swapfile = false -- Disable swapfile
opt.completeopt = "menuone,noinsert,noselect" -- Autocomplete options

-- UI
opt.number = true -- Show line numbers
opt.relativenumber = true -- Show relative line numbers
opt.signcolumn = "yes" -- Always show sign column
opt.wrap = true -- Enable text wrapping by default
opt.linebreak = true -- Break lines at word boundaries
opt.showbreak = "↳ " -- Symbol for wrapped lines
opt.breakindent = true -- Maintain indent when wrapping
opt.cursorline = true -- Highlight current line
opt.cursorlineopt = "number" -- Only highlight the line number
opt.colorcolumn = "80" -- Show column at 80 characters
opt.pumheight = 10 -- Popup menu height
opt.pumblend = 10 -- Popup menu transparency
opt.winblend = 0 -- Window transparency
opt.cmdheight = 1 -- Command line height
opt.laststatus = 3 -- Global statusline
opt.showtabline = 2 -- Always show bufferline
opt.splitbelow = true -- Horizontal splits go below
opt.splitright = true -- Vertical splits go right
opt.termguicolors = true -- Enable 24-bit RGB colors
opt.showmode = false -- Don't show mode (statusline shows it)
opt.ruler = false -- Don't show ruler
opt.showcmd = false -- Don't show command in statusline
opt.title = true -- Set terminal title
opt.titlelen = 0 -- Don't truncate title
opt.fillchars = {
  eob = " ", -- End of buffer
  fold = " ",
  foldsep = " ",
}

-- Indentation
opt.expandtab = true -- Use spaces instead of tabs
opt.shiftwidth = 2 -- Size of an indent
opt.tabstop = 2 -- Number of spaces tabs count for
opt.softtabstop = 2 -- Number of spaces that <Tab> uses while editing
opt.smartindent = true -- Smart autoindenting
opt.shiftround = true -- Round indent

-- Search
opt.ignorecase = true -- Ignore case in search
opt.smartcase = true -- Case sensitive if uppercase used
opt.hlsearch = false -- Don't highlight search results
opt.incsearch = true -- Incremental search

-- Performance
opt.lazyredraw = true -- Don't redraw during macros
opt.synmaxcol = 240 -- Max column for syntax highlight
opt.updatetime = 250 -- Faster CursorHold events
opt.timeout = true
opt.timeoutlen = 300 -- Time to wait for mapped sequence
opt.ttimeoutlen = 0 -- Time to wait for key codes

-- Folding
opt.foldcolumn = "1" -- Show fold column
opt.foldlevel = 99 -- Using ufo provider need a large value
opt.foldlevelstart = 99 -- Start with all folds open
opt.foldenable = true -- Enable folding

-- Backup and undo
opt.backup = false -- Don't create backup files
opt.writebackup = false -- Don't create backup before overwriting
opt.undofile = true -- Enable persistent undo
opt.undolevels = 10000 -- Maximum number of undos

-- Scrolling
opt.scrolloff = 8 -- Lines of context
opt.sidescrolloff = 8 -- Columns of context
opt.smoothscroll = true -- Smooth scrolling

-- Wildmenu
opt.wildmode = "longest:full,full" -- Command line completion mode
opt.wildoptions = "pum" -- Use popup menu for wildmenu

-- Misc
opt.confirm = true -- Confirm before closing unsaved files
opt.hidden = true -- Allow hidden buffers
opt.joinspaces = false -- No double spaces with join
opt.startofline = false -- Don't reset cursor to start of line
opt.whichwrap:append("<,>,[,],h,l") -- Move to next line with these keys
opt.iskeyword:append("-") -- Treat dash as part of word