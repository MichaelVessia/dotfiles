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

local neogit = require("neogit")
map("n", "<leader>G", function()
  neogit.open()
end, { desc = "Neo[G]it" })


function SendContextToClipboard()
    -- Get the current file path
    local file_path = vim.fn.expand('%:p') -- %:p gets the full path

    -- Get the selected lines
    local start_line = vim.fn.getpos("'<")[2]
    local end_line = vim.fn.getpos("'>")[2]
    local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)

    local formatted_snippet = ""
    -- Start with file path and range
    formatted_snippet = formatted_snippet .. "-- File: " .. file_path .. "\n"
    formatted_snippet = formatted_snippet .. "-- Lines: " .. start_line .. "-" .. end_line .. "\n\n"

    -- Add the code snippet with line numbers
    for i, line in ipairs(lines) do
        formatted_snippet = formatted_snippet .. (start_line + i - 1) .. ": " .. line .. "\n"
    end

    -- Use Neovim's built-in clipboard integration
    vim.fn.setreg('+', formatted_snippet)
    
    vim.notify("Context (File, Lines, Snippet) copied to clipboard!")
end

-- Map this function to a keybinding
vim.keymap.set('v', '<leader>ctx', [[ :lua SendContextToClipboard()<CR> ]], { desc = "Send code context (file, lines, snippet) to clipboard" })
