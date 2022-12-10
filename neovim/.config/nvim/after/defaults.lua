require("telescope").load_extension("file_browser")
require("telescope").load_extension("dir")

local create_augroup = vim.api.nvim_create_augroup
local create_autocmd = vim.api.nvim_create_autocmd

local packer_user_config = create_augroup("packer_user_config", { clear = true })
create_autocmd("BufWritePost", {
	pattern = "*/lua/custom/plugins/init.lua",
	command = "source <afile> | PackerCompile",
	group = packer_user_config,
})

local relativenumber_toggle = create_augroup("relativenumber_toggle", { clear = true })
create_autocmd({ "BufLeave", "InsertEnter", "FocusLost" }, {
	--     pattern = "*",
	callback = function()
		if vim.bo.filetype ~= "alpha" and vim.bo.filetype ~= "NvimTree" and vim.bo.filetype ~= "SidebarNvim" then
			vim.opt.relativenumber = false
			vim.opt.list = true
		end
	end,
	group = relativenumber_toggle,
})
create_autocmd({ "BufEnter", "InsertLeave", "FocusGained" }, {
	--     pattern = "*",
	callback = function()
		if vim.bo.filetype ~= "alpha" and vim.bo.filetype ~= "NvimTree" and vim.bo.filetype ~= "SidebarNvim" then
			vim.opt.relativenumber = true
			vim.opt.list = false
		end
	end,
	group = relativenumber_toggle,
})


vim.keymap.set("n", "<leader>.", "", {
	silent = true,
	desc = "reload init.lua",
	callback = function()
		vim.cmd([[
			update $MYVIMRC
			source $MYVIMRC
			]])
		vim.notify("Nvim config successfully reloaded!", vim.log.levels.INFO, { title = "nvim-config" })
	end,
})

vim.keymap.set("n", "<leader>=", function()
	vim.lsp.buf.format({
		filter = function(client)
			return client.name == "null-ls"
		end,
	})
end, { desc = "[F]ormat", noremap = true, silent = true })

vim.keymap.set("n", "<leader>l", require("lsp_lines").toggle, { desc = "Toggle lsp_lines" })
vim.diagnostic.config({ virtual_text = false })
vim.keymap.set("n", "<leader>ps", "<cmd>PackerSync<cr>", { desc = "[P]acker [S]ync" })

-- Enable vim+tmux nav
-- vim.g.tmux_navigator_no_mappings = 1
-- vim.keymap.set( 'n', '<c-k>', ':TmuxNavigateUp<cr>', { silent = true })
-- vim.keymap.set( 'n', '<c-j>', ':TmuxNavigateDown<cr>', { silent = true })
-- vim.keymap.set( 'n', '<c-h>', ':TmuxNavigateLeft<cr>', { silent = true })
-- vim.keymap.set( 'n', '<c-l>', ':TmuxNavigateRight<cr>', { silent = true })

-- vim.keymap.set('n', '<leader>gw', [[<Cmd>lua require("telescope").extensions.git_worktree.git_worktrees()<CR>]], { desc = '[G]it [W]orktree' })
-- vim.keymap.set('n', '<leader>gm', [[<Cmd>lua require("telescope").extensions.git_worktree.create_git_worktree()<CR>]], { desc = '[Git] Worktree [M]ake' })
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = '[F]ind [F]iles' })
vim.keymap.set('n', '<leader>fa', function() require('telescope.builtin').find_files({hidden = true}) end, { desc = '[F]ind [A]ll (hidden) [F]iles' })
vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, { desc = '[F]ind [H]elp' })
vim.keymap.set('n', '<leader>fw', require('telescope.builtin').grep_string, { desc = '[F]ind current [W]ord' })
vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, { desc = '[F]ind by [G]rep' })
vim.keymap.set('n', '<leader>fd', require('telescope.builtin').diagnostics, { desc = '[F]ind [D]iagnostics' })
vim.keymap.set('n', '<leader>fn', ':Telescope notify<cr>', { desc = '[F]ind [N]otifications' })
vim.keymap.set("n", "<leader>fdg", "<cmd>Telescope dir live_grep<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>sdf", "<cmd>Telescope dir find_files<CR>", { noremap = true, silent = true })

-- Enable easy editing of my config
vim.keymap.set('n', '<leader>rc', ':tabnew $MYVIMRC<cr>', { desc = 'Edit Vim[rc]' })

-- Fugitive
vim.keymap.set('n', '<leader>gs', ':G<cr>', { desc = '[G]it [S]tatus' })
vim.keymap.set('n', '<leader>gl', ':Git blame<cr>', { desc = '[G]it B[l]ame' })
vim.keymap.set('n', '<leader>gr', ':GBrowse<cr>', { desc = '[G]it [R]epo' })
vim.keymap.set('n', '<leader>gp', ':Git push -u origin HEAD<cr>', { desc = '[G]it [P]ush' })
vim.keymap.set('n', '<leader>gpn', ':Git push -u origin HEAD --no-verify<cr>', { desc = '[G]it [P]ush [N]o verify' })
vim.keymap.set('n', '<leader>gf', ':Git pull<cr>', { desc = '[G]it [F]etch (Pull)' })
vim.keymap.set('n', '<leader>gd', ':Git diff<cr>', { desc = '[G]it [D]iff' })


-- Command aliases for typos
vim.keymap.set('c', 'W', 'w')
vim.keymap.set('c', 'Q', 'q')
vim.keymap.set('c', 'WQ', 'wq')
vim.keymap.set('c', 'Wq', 'wq')

-- trouble (diagnostics viewer)
-- vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
--   {silent = true, noremap = true, desc = 'Diagnosti[X] Toggle' })
-- vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>",
--   {silent = true, noremap = true, desc = 'Diagnosti[X] [W]orkspace' })
-- vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",
--   {silent = true, noremap = true, desc = 'Diagnosti[X] [D]ocument' })
-- vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>",
--   {silent = true, noremap = true, desc = 'Diagnosti[X] [L]oclist' })
-- vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
--   {silent = true, noremap = true, desc = 'Diagnosti[X] [Q]uickfix' })
-- vim.keymap.set("n", "<leader>xr", "<cmd>TroubleToggle lsp_references<cr>",
--   {silent = true, noremap = true, desc = 'Diagnosti[X] [R]eferences' })
-- Diagnostic keymaps
vim.keymap.set('n', '<leader>xp', vim.diagnostic.goto_prev, { desc = 'Diagnosti[X] [P]rev' })
vim.keymap.set('n', '<leader>xn', vim.diagnostic.goto_next, { desc = 'Diagnosti[X] [N]ext' })
vim.keymap.set('n', '<leader>xf', vim.diagnostic.open_float, { desc = 'Diagnosti[X] open [F]loat' })
--
-- obsidian (notes)
-- vim.keymap.set("n", "<leader>nb", "<cmd>ObsidianBacklinks<cr>",
--   {silent = true, noremap = true, desc = '[N]ote References [B]ack' }
-- )
-- vim.keymap.set("n", "<leader>nf", "<cmd>ObsidianFollowLink<cr>",
--   {silent = true, noremap = true, desc = '[N]ote References [F]orward' }
-- )
-- vim.keymap.set("n", "<leader>nt", "<cmd>ObsidianToday<cr>",
--   {silent = true, noremap = true, desc = '[N]ote [T]oday' }
-- )
-- vim.keymap.set("n", "<leader>no", "<cmd>ObsidianOpen<cr>",
--   {silent = true, noremap = true, desc = '[N]ote [O]pen in obsidian' }
-- )
-- vim.keymap.set("n", "<leader>ns", "<cmd>ObsidianSearch<cr>",
--   {silent = true, noremap = true, desc = '[N]ote [S]earch' }
-- )
-- vim.keymap.set("n", "<leader>nlf", "<cmd>ObsidianLink<cr>",
--   {silent = true, noremap = true, desc = '[N]ote [F]ind [L]ink' }
-- )
-- vim.keymap.set("n", "<leader>nlc", "<cmd>ObsidianLinkNew<cr>",
--   {silent = true, noremap = true, desc = '[N]ote [C]reate [L]ink' }
-- )
-- vim.keymap.set("n", "<leader>nd", "<cmd>e ~/vault<cr>",
--   {silent = true, noremap = true, desc = '[N]ote [D]irectory' }
-- )
-- vim.keymap.set("n", "<leader>nn", ":ObsidianNew",
--   {silent = true, noremap = true, desc = '[N]ew [N]ote' }
-- )

-- Enable File Tree
-- vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
-- vim.keymap.set('n', '<C-n>', ':Neotree reveal toggle<cr>', { desc = 'Neo[T]ree' })
vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>r", "<cmd>NvimTreeRefresh<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>n", "<cmd>NvimTreeFindFile<cr>", { noremap = true, silent = true })

-- Open dashboard
vim.keymap.set("n", "<leader>d", "<cmd>Alpha<cr>", { noremap = true, silent = true })


-- Enable hybrid numbers, shows the current line number instead of 0
-- Make line numbers relative and highlight current line
vim.wo.relativenumber = true
-- Find my cursor more easily
vim.wo.cursorline = true

-- Save undo history
vim.o.undofile = true
-- Fix for storybook reload
vim.o.backupcopy = 'yes'
-- Turn off swapfiles
vim.o.swapfile = false
