vim.opt.signcolumn = 'yes' -- Reserve space for diagnostic icons

local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.ensure_installed({
  'tsserver',
  'eslint',
  'sumneko_lua',
})

lsp.nvim_workspace()

lsp.setup()

--vim.keymap.set("n", "<leader>l", require("lsp_lines").toggle, { desc = "Toggle lsp_lines" })

vim.keymap.set("n", '<leader>rn', vim.lsp.buf.rename, { desc = '[R]e[n]ame' })
vim.keymap.set("n", '<leader>ca', vim.lsp.buf.code_action, { desc = '[C]ode [A]ction' })

vim.keymap.set("n", 'gd', vim.lsp.buf.definition, { desc = '[G]oto [D]efinition' })
vim.keymap.set("n", 'gi', vim.lsp.buf.implementation, { desc = '[G]oto [I]mplementation' })
vim.keymap.set("n", 'gr', require('telescope.builtin').lsp_references)
vim.keymap.set("n", '<leader>ds', require('telescope.builtin').lsp_document_symbols, { desc = '[D]ocument [S]ymbols' })
vim.keymap.set("n", '<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, { desc = '[W]orkspace [S]ymbols' })

-- See `:help K` for why this keymap
vim.keymap.set("n", 'K', vim.lsp.buf.hover, { desc = 'Hover Documentation' })
vim.keymap.set("n", '<C-S-k>', vim.lsp.buf.signature_help, { desc = 'Signature Documentation' })
