vim.g.mapleader = " "

-- Open netrw
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Command aliases for typos
vim.keymap.set('c', 'W', 'w')
vim.keymap.set('c', 'Q', 'q')
vim.keymap.set('c', 'WQ', 'wq')
vim.keymap.set('c', 'Wq', 'wq')

-- Packer 
vim.keymap.set("n", "<leader>ps", "<cmd>PackerSync<cr>", { desc = "[P]acker [S]ync" })
