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

	-- Project search and fuzzy find
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	-- color scheme
	use 'navarasu/onedark.nvim'

	-- Syntax tree parsing for highlighting and other goodies
	use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

	-- Quick file navigation
	use 'theprimeagen/harpoon'

	-- Undo tree visualizer
	use 'mbbill/undotree'

end)
