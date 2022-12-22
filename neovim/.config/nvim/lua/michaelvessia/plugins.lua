return {
	-- color scheme
	{ 'navarasu/onedark.nvim',
	lazy = false,
	config = function()
		require("onedark").setup({})
	end,
},

	-- vim + tmux integration
	"christoomey/vim-tmux-navigator",

	-- Project search and fuzzy find
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		dependencies = {'nvim-lua/plenary.nvim'}
	},

	-- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
	{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make', cond = vim.fn.executable 'make' == 1 },

	-- Syntax tree parsing for highlighting and other goodies
	{ 'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
		event = 'BufReadPost',
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"RRethy/nvim-treesitter-textsubjects",
			"nvim-treesitter/nvim-treesitter-refactor",
			"mfussenegger/nvim-treehopper",
			{ "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" },
		}
	},

	-- Quick file navigation
	'theprimeagen/harpoon',

	-- Undo tree visualizer
	'mbbill/undotree',

	-- Git related plugins
	'tpope/vim-fugitive',
	'tpope/vim-rhubarb',
	'lewis6991/gitsigns.nvim',

	-- Fancier statusline
	'nvim-lualine/lualine.nvim',

	-- Add indentation guides even on blank lines
	'lukas-reineke/indent-blankline.nvim',

	-- "gc" to comment visual regions/lines
	'numToStr/Comment.nvim',

	-- Detect tabstop and shiftwidth automatically
	'tpope/vim-sleuth',

	-- keybind viewer
	"folke/which-key.nvim",

	-- lsp_lines is a simple neovim plugin that renders diagnostics using virtual lines on top of the real line of code.
	-- TODO: Figure out why lazy.nvim can't install this
	-- {
	-- 	'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
	-- 	config = function()
	-- 		require('lsp_lines').setup()
	-- 	end,
	-- },

	-- smooth scrolling
	{
		"karb94/neoscroll.nvim",
		config = function()
			require("neoscroll").setup({})
		end,
	},

	-- better quickfix menu
	"kevinhwang91/nvim-bqf",

	-- shows contex at top of screen (function, class, etc)
	{
		"nvim-treesitter/nvim-treesitter-context",
		config = function()
			require("treesitter-context").setup()
		end,
	},

	-- file browser
	"nvim-telescope/telescope-file-browser.nvim",

	-- LSP config
	{
		'VonHeikemen/lsp-zero.nvim',
		dependencies = {
			-- LSP Support
			'neovim/nvim-lspconfig',
			'williamboman/mason.nvim',
			'williamboman/mason-lspconfig.nvim',
			'j-hui/fidget.nvim',

			-- Autocompletion
			'hrsh7th/nvim-cmp',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'saadparwaiz1/cmp_luasnip',
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-nvim-lua',

			-- Snippets
			'L3MON4D3/LuaSnip',
			'rafamadriz/friendly-snippets'
		}
	},

	{
		"nvim-neorg/neorg",
		build = ":Neorg sync-parsers", -- This is the important bit!
		dependencies = "nvim-neorg/neorg-telescope" -- Be sure to pull in the repo
	},

	-- set root directory automatically
	"airblade/vim-rooter"

}
