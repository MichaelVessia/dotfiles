vim.g.mapleader = " "

-- Command aliases for typos
vim.keymap.set('c', 'W', 'w')
vim.keymap.set('c', 'Q', 'q')
vim.keymap.set('c', 'WQ', 'wq')
vim.keymap.set('c', 'Wq', 'wq')

-- Packer 
vim.keymap.set("n", "<leader>ps", "<cmd>PackerSync<cr>", { desc = "[P]acker [S]ync" })

-- Move highlighted things around
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep cursor in place when using J to join lines
vim.keymap.set("n", "J", "mzJ`z")

-- Allow C-d and C-u (half page jumps) to keep cursor in the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Keep cursor in the middle after searches
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Paste over highlighted text without losing copied text in buffer, by sending the content to void buffer
vim.keymap.set("x", "<leader>p", [["_dP]])


-- Yank to system clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- switch projects
--vim.keymap.set("n", "<C-p>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- format buffer
vim.keymap.set("n", "<C-f>", function() vim.lsp.buf.format() end)

-- helper for substitution, replace the word you are on
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- make the current file executable
--vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Quickly access dotfiles
vim.keymap.set('n', '<leader>rc', ':e ~/.dotfiles<cr>')
