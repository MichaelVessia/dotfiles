require('neorg').setup {
	load = {
		["core.defaults"] = {},
		["core.norg.dirman"] = {
			config = {
				workspaces = {
					work = "~/notes/work",
					home = "~/notes/home",
				}
			}
		}
	}
}

-- workspaces
vim.keymap.set("n", "<leader>nwh", ':Neorg workspace home<CR>', { desc = "[N]ote [W]orkspace [H]ome" })
vim.keymap.set("n", "<leader>nww", ':Neorg workspace work<CR>', { desc = "[N]ote [W]orkspace [W]ork" })
-- metadata
vim.keymap.set("n", "<leader>nm", ':Neorg inject-metadata<CR>', { desc = "Inject [N]ote [M]etadata" })
-- journaling
vim.keymap.set("n", "<leader>njt", ':Neorg journal today<CR>', { desc = "[N]ote [J]ournal [T]oday" })
vim.keymap.set("n", "<leader>njy", ':Neorg journal yesterday<CR>', { desc = "[N]ote [J]ournal [Y]esterday" })
vim.keymap.set("n", "<leader>njm", ':Neorg journal tomorrow<CR>', { desc = "[N]ote [J]ournal Tom[M]orrow" })
-- toc
vim.keymap.set("n", "<leader>ntocs", ':Neorg toc split<CR>', { desc = "[N]ote [TOC] [S]plit" })
