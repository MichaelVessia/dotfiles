-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

-- Show a status line on each split
opt.laststatus = 2
opt.swapfile = false
-- Prevent sync with system clipboard
opt.clipboard = ""

-- Save files in such a way that hot reloading works
opt.backup = false
opt.writebackup = false
