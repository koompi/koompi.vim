-- Keymaps for koompi.nvim

local map = vim.keymap.set

-- Better escape
map("i", "jk", "<ESC>")

-- Clear search highlights
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Save and quit
map("n", "<leader>w", "<cmd>w<CR>")
map("n", "<leader>q", "<cmd>q<CR>")

-- Better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Move lines
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Window navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Buffer navigation
map("n", "<S-h>", "<cmd>bprevious<CR>")
map("n", "<S-l>", "<cmd>bnext<CR>")
map("n", "<leader>bd", "<cmd>bdelete<CR>")

-- File explorer
map("n", "<leader>e", "<cmd>Neotree toggle<CR>")
map("n", "<C-n>", "<cmd>Neotree toggle<CR>")

-- Fuzzy finder
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>")
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>")
map("n", "<C-p>", "<cmd>Telescope find_files<CR>")