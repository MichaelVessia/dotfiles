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
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- Unbind the extremely annoying binds that come with lazyvim by default
map("n", "<A-j>", "<Nop>", { desc = "Move down" })
map("n", "<A-k>", "<Nop>", { desc = "Move up" })
map("i", "<A-j>", "<Nop>", { desc = "Move down" })
map("i", "<A-k>", "<Nop>", { desc = "Move up" })
map("v", "<A-j>", "<Nop>", { desc = "Move down" })
map("v", "<A-k>", "<Nop>", { desc = "Move up" })
