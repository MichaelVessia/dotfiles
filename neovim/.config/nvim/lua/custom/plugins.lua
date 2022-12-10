local plugins = {}

vim.cmd([[ 
  augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

function plugins.setup(use)
	-- color scheme
	--use("Mofiqul/dracula.nvim")

	-- EditorConfig helps maintain consistent coding styles for multiple developers working on the same project across various editors and IDEs.
	use( 'editorconfig/editorconfig-vim' )
	-- vim + tmux integration
	use({ "christoomey/vim-tmux-navigator" })
	-- file browser powered by telescope
	use({ "nvim-telescope/telescope-file-browser.nvim" })
	-- keybind viewer
	use({
		"folke/which-key.nvim",
		opt = true,
		event = "VimEnter",
		config = function()
			require("which-key").setup({})
		end,
	})
	-- LSP status viewer in bottom right
	use({
		"j-hui/fidget.nvim",
		config = function()
			require("fidget").setup({})
		end,
	})
	-- file tree
	use({
		"kyazdani42/nvim-tree.lua",
		requires = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("nvim-tree").setup({})
		end,
	})
	-- tab viewer on top
	use({
		"akinsho/bufferline.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("bufferline").setup({})
		end,
	})
	-- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua.
	use({
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			local null_ls = require("null-ls")
			local formatting = null_ls.builtins.formatting
			local diagnostics = null_ls.builtins.diagnostics
			require("null-ls").setup({
				sources = {
					-- formatting.stylua,
					-- formatting.prettier.with({
					-- 	condition = function(utils)
					-- 		return utils.root_has_file(".prettierrc")
					-- 	end,
					-- }),
					formatting.eslint_d.with({
						condition = function(utils)
							return utils.root_has_file(".eslintrc.js")
						end,
					}),
					diagnostics.eslint_d.with({
						condition = function(utils)
							return utils.root_has_file(".eslintrc.js")
						end,
					}),
					-- formatting.eslint_d,
					-- diagnostics.eslint_d
				},
			})
		end,
		requires = { "nvim-lua/plenary.nvim" },
	})
	-- mason-null-ls bridges mason.nvim with the null-ls plugin - making it easier to use both plugins together.
	use({
		"jayp0521/mason-null-ls.nvim",
		config = function()
			require("mason-null-ls").setup({
				ensure_installed = { "stylua", "prettier", "eslint", "eslint_d" },
			})
		end,
	})

	use("windwp/nvim-autopairs")
	-- Use treesitter to autoclose and autorename html tag
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" })

	-- lsp_lines is a simple neovim plugin that renders diagnostics using virtual lines on top of the real line of code.
	use({
		"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
		config = function()
			require("lsp_lines").setup()
		end,
	})

	-- dashboard
	use({
		"goolord/alpha-nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
		config = function()
			local alpha = require("alpha")
			local dashboard = require("alpha.themes.dashboard")
			dashboard.section.header.val = {
				"                                                     ",
				"  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
				"  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
				"  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
				"  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
				"  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
				"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
				"                                                     ",
				"                   [ @MichaelVessia ]                  ",
			}
			dashboard.section.buttons.val = {
				dashboard.button("e", "  New file", ":ene<cr>"),
				dashboard.button("<c-n>", "  File Explorer"),
				dashboard.button("<leader>ff", "  Find File"),
				dashboard.button("<leader>fg", "  Grep Word"),
				dashboard.button("<leader>ps", "↑  Update plugins", ":PackerSync<cr>"),
				dashboard.button("<leader>.", "  Reload config"),
				dashboard.button("<leader>?", "  Recent Files"),
				dashboard.button("q", "  Quit", ":qa<cr>"),
			}
			-- dashboard.section.footer.val = require'alpha.fortune'()
			dashboard.section.footer.val = function()
				local total_plugins = #vim.tbl_keys(packer_plugins)
				local datetime = os.date(" %d-%m-%Y   %H:%M:%S")
				-- local res = curl.get("https://icanhazdadjoke.com", {
				-- 	accept = "text/plain",
				-- })
				-- vim.notify(res.body)
				return "\n"
					.. datetime
					.. "   "
					.. total_plugins
					.. " plugins"
					.. "   v"
					.. vim.version().major
					.. "."
					.. vim.version().minor
					.. "."
				.. vim.version().patch
			end
			alpha.setup(dashboard.opts)
		end,
	})

	-- smooth scrolling
	use({
		"karb94/neoscroll.nvim",
		config = function()
			require("neoscroll").setup({})
		end,
	})

	-- better quickfix menu
	use({ "kevinhwang91/nvim-bqf" })

	-- shows contex at top of screen (function, class, etc)
	use({
		"nvim-treesitter/nvim-treesitter-context",
		config = function()
			require("treesitter-context").setup()
		end,
	})

	-- add more motions for text objects ([ydc]s<target>) for yank/delete/change surrounding target. e.g. dst, ds]
	use({
		"kylechui/nvim-surround",
		tag = "*",
		config = function()
			require("nvim-surround").setup()
		end,
	})

	-- find file in particular directory
	use({
		"princejoogie/dir-telescope.nvim",
		requires = { "nvim-telescope/telescope.nvim" },
		config = function()
			require("dir-telescope").setup({
				hidden = true,
				respect_gitignore = true,
			})
		end,
	})

	-- Easily jump throughout file
	use({
		"ggandor/leap.nvim",
		config = function()
			require("leap").add_default_mappings()
		end,
	})

	-- note taking
	use {
		"nvim-neorg/neorg",
		config = function()
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
		end,
		requires = "nvim-lua/plenary.nvim"
	}

	-- view vim startup time
	use({
		"dstein64/vim-startuptime",
		opt = true,
		cmd = { "StartupTime" },
	})
end

return plugins
