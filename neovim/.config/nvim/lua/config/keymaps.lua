-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Unbind the extremely annoying binds that come with lazyvim by default
vim.keymap.set("n", "<A-j>", "<Nop>")
vim.keymap.set("n", "<A-k>", "<Nop>")
vim.keymap.set("i", "<A-j>", "<Nop>")
vim.keymap.set("i", "<A-k>", "<Nop>")
vim.keymap.set("v", "<A-j>", "<Nop>")
vim.keymap.set("v", "<A-k>", "<Nop>")

-- Command aliases for typos
vim.keymap.set("c", "W", "w")
vim.keymap.set("c", "Q", "q")
vim.keymap.set("c", "WQ", "wq")
vim.keymap.set("c", "Wq", "wq")

-- Move highlighted things around
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
