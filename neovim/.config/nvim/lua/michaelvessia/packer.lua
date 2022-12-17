-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	is_bootstrap = true
	vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
	vim.cmd [[packadd packer.nvim]]
end


require('packer').startup(function(use)
	-- Package manager
	use 'wbthomason/packer.nvim'

	-- vim + tmux integration
	use({ "christoomey/vim-tmux-navigator" })

	-- Project search and fuzzy find
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	-- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
	use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }

	-- Syntax tree parsing for highlighting and other goodies
	use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

	-- Quick file navigation
	use 'theprimeagen/harpoon'

	-- Undo tree visualizer
	use 'mbbill/undotree'

	-- Git related plugins
	use 'tpope/vim-fugitive'
	use 'tpope/vim-rhubarb'
	use 'lewis6991/gitsigns.nvim'

	-- color scheme
	use 'navarasu/onedark.nvim'
	-- Fancier statusline
	use 'nvim-lualine/lualine.nvim'
	-- Add indentation guides even on blank lines
	use 'lukas-reineke/indent-blankline.nvim'
	-- "gc" to comment visual regions/lines
	use 'numToStr/Comment.nvim'
	-- Detect tabstop and shiftwidth automatically
	use 'tpope/vim-sleuth'

	-- keybind viewer
	use({
		"folke/which-key.nvim",
		opt = true,
		event = "VimEnter",
		config = function()
			require("which-key").setup({})
		end,
	})

-- lsp_lines is a simple neovim plugin that renders diagnostics using virtual lines on top of the real line of code.
	use({
		"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
		config = function()
			require("lsp_lines").setup()
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

	-- file browser
	use { "nvim-telescope/telescope-file-browser.nvim" }

	-- LSP config
	use {
		'VonHeikemen/lsp-zero.nvim',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},
			{'j-hui/fidget.nvim'},

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-buffer'},
			{'hrsh7th/cmp-path'},
			{'saadparwaiz1/cmp_luasnip'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'hrsh7th/cmp-nvim-lua'},

			-- Snippets
			{'L3MON4D3/LuaSnip'},
			{'rafamadriz/friendly-snippets'},
		}
	}


end)
