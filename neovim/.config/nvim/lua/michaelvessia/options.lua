-- [[ Setting options ]]
-- See `:help vim.o`

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 50
vim.wo.signcolumn = 'yes'

-- Set colorscheme
vim.o.termguicolors = true
vim.cmd [[colorscheme onedark]]

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


vim.o.backupcopy = 'yes' -- Fix for storybook reload
--vim.opt.clipboard = "unnamedplus" -- allows access to system clipboard
vim.opt.shiftwidth = 4 -- number of spaces inserted for indentation
vim.opt.tabstop = 4 -- number of spaces that a <tab> represents
vim.opt.expandtab = false -- don't replace tabs with spaces
vim.opt.wrap = false -- don't wrap long content on next line
vim.opt.relativenumber = true -- show relative line number to the cursor
vim.opt.swapfile = false -- temporary copy of your opened buffer
vim.opt.shiftwidth = 4 -- number of spaces inserted for indentation
vim.opt.scrolloff = 8 -- minimum number of lines to keep above and below cursor
vim.opt.cursorline = true -- highlight line where the cursor is located
vim.opt.colorcolumn = "80" -- column highlighted with hl-ColorColumn
vim.opt.showmode = false -- remove messages like insert, replace, etc...
vim.opt.smartindent = true -- indent automatically for c-like languages
vim.opt.splitbelow = true -- add split below current one
vim.opt.splitright = true -- add split to the right of current one
-- vim.opt.lazyredraw = true         -- don't redraw screen while executing macros, etc...
vim.opt.list = false -- show hidden whitespace characters
vim.opt.listchars = { -- list of hidden characters
	tab = "» ",
	trail = "•",
	precedes = "←",
	extends = "→",
	eol = "↲",
	space = "␣",
}
vim.opt.laststatus = 3 -- always and ONLY the last window
vim.opt.winbar = "%=%m %f" -- determine contents of top window bar
vim.opt.cmdheight = 0 -- hide command-line bar when not used
vim.g.netrw_keepdir = 0 -- keey the current dir the same as browsing dir
vim.g.netrw_winsize = 30 -- initial size of new netrw windows
vim.g.netrw_banner = 0 -- hide banner
vim.g.netrw_browse_split = 4 -- open in previous window
vim.g.netrw_altv = 1 -- open with right splitting
vim.g.netrw_liststyle = 3 -- tree-style view
