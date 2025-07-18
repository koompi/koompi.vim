--[[
██╗  ██╗ ██████╗  ██████╗ ███╗   ███╗██████╗ ██╗██╗   ██╗██╗███╗   ███╗
██║ ██╔╝██╔═══██╗██╔═══██╗████╗ ████║██╔══██╗██║██║   ██║██║████╗ ████║
█████╔╝ ██║   ██║██║   ██║██╔████╔██║██████╔╝██║██║   ██║██║██╔████╔██║
██╔═██╗ ██║   ██║██║   ██║██║╚██╔╝██║██╔═══╝ ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║  ██╗╚██████╔╝╚██████╔╝██║ ╚═╝ ██║██║     ██║ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═╝ ╚═════╝  ╚═════╝ ╚═╝     ╚═╝╚═╝     ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝

  A modern, beautiful Neovim configuration
  Inspired by NvChad • VS Code-like experience • Built for developers

  GitHub: https://github.com/yourusername/koompivim.nvim
  License: MIT
--]]

-- Set leader keys before loading anything
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Bootstrap lazy.nvim plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- Load core configuration
require("config.options")
require("config.keymaps")
require("config.autocmds")

-- Setup lazy.nvim and load plugins
require("lazy").setup({
  spec = {
    { import = "plugins" },
    { import = "ui" },
  },
  defaults = {
    lazy = false,
    version = false,
  },
  install = { colorscheme = { "catppuccin" } },
  checker = { enabled = true, notify = false },
  change_detection = { notify = false },
  ui = {
    border = "rounded",
    backdrop = 60,
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
        "netrwPlugin",
      },
    },
  },
})