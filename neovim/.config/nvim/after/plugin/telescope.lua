local builtin = require("telescope.builtin")
local themes = require("telescope.themes")


-- See `:help telescope.builtin`
vim.keymap.set("n", "<leader>?", builtin.oldfiles, { desc = "[?] Find recently opened files" })
vim.keymap.set("n", "<leader><space>", builtin.buffers, { desc = "[ ] Find existing buffers" })
vim.keymap.set("n", "<leader>/", function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  builtin.current_buffer_fuzzy_find(themes.get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = "[/] Fuzzily search in current buffer]" })

vim.keymap.set("n", "<leader>ff", builtin.git_files, { desc = "[F]ind [F]iles (Git)" })
vim.keymap.set("n", "<leader>fp", builtin.find_files, { desc = "[F]ind [P]roject files" })
vim.keymap.set("n", "<leader>fh", function() builtin.find_files({hidden = true}) end, { desc = "[F]ind [h]idden files" })
vim.keymap.set("n", "<leader>fH", builtin.help_tags, { desc = "[F]ind [H]elp" })
vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "[F]ind current [W]ord" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "[F]ind by [G]rep" })
vim.keymap.set("n", "<leader>fG", function() builtin.grep_string({ search = vim.fn.input("Grep > ") }) end, { desc = "[F]ind by [G]rep" })
vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "[F]ind [D]iagnostics" })
vim.keymap.set("n", "<leader>fn", ":Telescope notify<cr>", { desc = "[F]ind [N]otifications" })
vim.keymap.set("n", "<leader>fdg", "<cmd>Telescope dir live_grep<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>fdf", "<cmd>Telescope dir find_files<CR>", { noremap = true, silent = true })
