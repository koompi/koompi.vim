-- Autocommands for koompi.nvim

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- General Settings
local general = augroup("General", { clear = true })

-- Check if we need to reload the file when it changed
autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
  group = general,
  command = "checktime",
})

-- Highlight on yank
autocmd("TextYankPost", {
  group = general,
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- resize splits if window got resized
autocmd({ "VimResized" }, {
  group = general,
  callback = function()
    local current_tab = vim.fn.tabpagenr()
    vim.cmd("tabdo wincmd =")
    vim.cmd("tabnext " .. current_tab)
  end,
})

-- go to last loc when opening a buffer
autocmd("BufReadPost", {
  group = general,
  callback = function(event)
    local exclude = { "gitcommit" }
    local buf = event.buf
    if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].koompi_last_loc then
      return
    end
    vim.b[buf].koompi_last_loc = true
    local mark = vim.api.nvim_buf_get_mark(buf, '"')
    local lcount = vim.api.nvim_buf_line_count(buf)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- close some filetypes with <q>
autocmd("FileType", {
  group = general,
  pattern = {
    "PlenaryTestPopup",
    "help",
    "lspinfo",
    "man",
    "notify",
    "qf",
    "query",
    "spectre_panel",
    "startuptime",
    "tsplayground",
    "neotest-output",
    "checkhealth",
    "neotest-summary",
    "neotest-output-panel",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- wrap and check for spell in text filetypes
autocmd("FileType", {
  group = general,
  pattern = { "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

-- Fix conceallevel for json files
autocmd({ "FileType" }, {
  group = general,
  pattern = { "json", "jsonc", "json5" },
  callback = function()
    vim.opt_local.conceallevel = 0
  end,
})

-- Auto create dir when saving a file, in case some intermediate directory does not exist
autocmd({ "BufWritePre" }, {
  group = general,
  callback = function(event)
    if event.match:match("^%w%w+://") then
      return
    end
    local file = vim.loop.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})

-- Terminal Settings
local term = augroup("Terminal", { clear = true })

autocmd("TermOpen", {
  group = term,
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.scrolloff = 0

    vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>", { buffer = true })
    vim.keymap.set("t", "<C-h>", "<cmd>wincmd h<cr>", { buffer = true })
    vim.keymap.set("t", "<C-j>", "<cmd>wincmd j<cr>", { buffer = true })
    vim.keymap.set("t", "<C-k>", "<cmd>wincmd k<cr>", { buffer = true })
    vim.keymap.set("t", "<C-l>", "<cmd>wincmd l<cr>", { buffer = true })
    vim.keymap.set("t", "<C-/>", "<cmd>close<cr>", { buffer = true })

    vim.cmd("startinsert!")
  end,
})

-- Turn off paste mode when leaving insert
autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste",
})

-- Disable the concealing in some file formats
autocmd("FileType", {
  pattern = { "json", "jsonc", "markdown" },
  callback = function()
    vim.opt.conceallevel = 0
  end,
})

-- Neo-tree auto-open
local neotree = augroup("Neotree", { clear = true })

autocmd("VimEnter", {
  group = neotree,
  desc = "Open Neotree automatically",
  callback = function()
    -- Don't open Neo-tree if dashboard is the current buffer
    if vim.fn.argc() == 0 and vim.bo.filetype ~= "dashboard" then
      vim.schedule(function()
        require("neo-tree.command").execute({ action = "show", position = "left", source = "filesystem" })
      end)
    end
  end,
})

-- Open Neo-tree when leaving dashboard
autocmd("BufEnter", {
  group = neotree,
  desc = "Open Neotree when leaving dashboard",
  callback = function()
    -- Check if we're leaving dashboard and going to a normal file
    if vim.bo.filetype ~= "dashboard" and vim.bo.buftype == "" then
      -- Check if Neo-tree is not already open
      local neo_tree_wins = vim.tbl_filter(function(win)
        local buf = vim.api.nvim_win_get_buf(win)
        return vim.bo[buf].filetype == "neo-tree"
      end, vim.api.nvim_list_wins())
      
      if #neo_tree_wins == 0 then
        vim.schedule(function()
          require("neo-tree.command").execute({ action = "show", position = "left", source = "filesystem" })
        end)
      end
    end
  end,
})