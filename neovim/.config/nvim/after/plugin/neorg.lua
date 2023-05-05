require('neorg').setup {
	load = {
		["core.defaults"] = {},
		["core.integrations.telescope"] = {}, -- Enable the telescope module
		["core.dirman"] = {
			config = {
				workspaces = {
					work = "~/notes/work",
					home = "~/notes/home",
				}
			}
		},
		["core.completion"] = {
			config = {
				engine = "nvim-cmp"
			}
		}
	}
}

local neorg_callbacks = require("neorg.callbacks")

neorg_callbacks.on_event("core.keybinds.events.enable_keybinds", function(_, keybinds)
	keybinds.map_event_to_mode("norg", {
		n = {
			{ "<C-s>", "core.integrations.telescope.find_linkable" },
		},

		i = {
			{ "<C-l>", "core.integrations.telescope.insert_link" },
		},
	},
	{
		silent = true,
		noremap = true,
	})
end)

-- workspaces
vim.keymap.set("n", "<leader>nd", ':e ~/notes<CR>', { desc = "[N]ote [D]ir" })
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
