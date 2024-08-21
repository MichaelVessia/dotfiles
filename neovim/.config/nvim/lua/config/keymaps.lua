-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- Unbind the extremely annoying binds that come with lazyvim by default
vim.keymap.set("n", "<A-j>", "<Nop>")
vim.keymap.set("n", "<A-k>", "<Nop>")
vim.keymap.set("i", "<A-j>", "<Nop>")
vim.keymap.set("i", "<A-k>", "<Nop>")
vim.keymap.set("v", "<A-j>", "<Nop>")
vim.keymap.set("v", "<A-k>", "<Nop>")

-- Command aliases for typos
--vim.keymap.set("c", "W", "w")
--vim.keymap.set("c", "Q", "q")
vim.keymap.set("c", "WQ", "wq")
vim.keymap.set("c", "Wq", "wq")

-- Move highlighted things around
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

map("n", "<leader>url", function()
  Util.toggle("relativenumber", false)
end, { desc = "Toggle Relative Line Numbers" })

-- Open file navigation window
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
