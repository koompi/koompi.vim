-- Keymaps for koompi.nvim
-- NvChad-inspired bindings with VS Code familiarity

local map = vim.keymap.set

-- Better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Move Lines
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- buffers
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- save file
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- lazy
map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- new file
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

-- quit
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })

-- NvChad style mappings
map("n", "<leader>n", "<cmd>set nu!<cr>", { desc = "Toggle line number" })
map("n", "<leader>rn", "<cmd>set rnu!<cr>", { desc = "Toggle relative number" })

-- NeoTree
map("n", "<C-n>", "<cmd>Neotree toggle<cr>", { desc = "Toggle Explorer" })
map("n", "<leader>e", "<cmd>Neotree focus<cr>", { desc = "Focus Explorer" })

-- Telescope
map("n", "<leader>fw", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help page" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<cr>", { desc = "Find oldfiles" })
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { desc = "Find in current buffer" })
map("n", "<leader>cm", "<cmd>Telescope git_commits<cr>", { desc = "Git commits" })
map("n", "<leader>gt", "<cmd>Telescope git_status<cr>", { desc = "Git status" })
map("n", "<leader>pt", "<cmd>Telescope terms<cr>", { desc = "Pick hidden term" })
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
map("n", "<leader>fa", "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<cr>", { desc = "Find all" })
map("n", "<C-p>", "<cmd>Telescope find_files<cr>", { desc = "Find files" })

-- terminal
map("n", "<leader>h", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", { desc = "Toggle horizontal term" })
map("n", "<leader>v", "<cmd>ToggleTerm size=80 direction=vertical<cr>", { desc = "Toggle vertical term" })

-- Comment
map("n", "<leader>/", "gcc", { desc = "Toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "Toggle comment", remap = true })

-- floating terminal
map("n", "<A-i>", "<cmd>ToggleTerm direction=float<cr>", { desc = "Toggle floating term" })
map("t", "<A-i>", "<cmd>ToggleTerm direction=float<cr>", { desc = "Toggle floating term" })
map("t", "<C-x>", vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), { desc = "Escape terminal mode" })

-- LSP
map("n", "gD", vim.lsp.buf.declaration, { desc = "LSP declaration" })
map("n", "gd", vim.lsp.buf.definition, { desc = "LSP definition" })
map("n", "K", vim.lsp.buf.hover, { desc = "LSP hover" })
map("n", "gi", vim.lsp.buf.implementation, { desc = "LSP implementation" })
map("n", "<leader>ls", vim.lsp.buf.signature_help, { desc = "LSP signature help" })
map("n", "<leader>D", vim.lsp.buf.type_definition, { desc = "LSP definition type" })
map("n", "<leader>ra", vim.lsp.buf.rename, { desc = "LSP rename" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP code action" })
map("n", "gr", vim.lsp.buf.references, { desc = "LSP references" })
map("n", "<leader>lf", vim.lsp.buf.format, { desc = "LSP formatting" })
map("n", "<leader>ld", vim.diagnostic.open_float, { desc = "Floating diagnostic" })
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Prev diagnostic" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Diagnostic loclist" })

-- NvChad like blankline toggle
map("n", "<leader>cc", function()
  local ok, start = require("indent_blankline.utils").get_current_context(
    vim.fn.line("."),
    vim.fn.line("w0"),
    vim.fn.line("w$"),
    vim.bo.shiftwidth
  )

  if ok then
    vim.api.nvim_win_set_cursor(vim.api.nvim_get_current_win(), { start, 0 })
    vim.cmd("normal! _")
  end
end, { desc = "Jump to current context" })

-- Add undo break-points
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")

-- Better escape
map("i", "jk", "<ESC>")

-- save in insert mode
map("i", "<C-s>", "<cmd>w<cr><esc>")

-- Don't copy the replaced text after pasting in visual mode
map("v", "p", '"_dP')

-- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
map({ "n", "v" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map({ "n", "v" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Copy all
map("n", "<C-c>", "<cmd>%y+<cr>", { desc = "Copy whole file" })