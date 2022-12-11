-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  vim.cmd [[packadd packer.nvim]]
end

-- stylua: ignore start
require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'                                              -- Package manager
  use 'tpope/vim-fugitive'                                                  -- Git commands in nvim
  use 'tpope/vim-rhubarb'                                                   -- Fugitive-companion to interact with github
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } } -- Add git related info in the signs columns and popups
  use 'numToStr/Comment.nvim'                                               -- "gc" to comment visual regions/lines
  use 'nvim-treesitter/nvim-treesitter'                                     -- Highlight, edit, and navigate code
  use 'nvim-treesitter/nvim-treesitter-textobjects'                         -- Additional textobjects for treesitter
  use 'neovim/nvim-lspconfig'                                               -- Collection of configurations for built-in LSP client
  use 'williamboman/mason.nvim'                                             -- Manage external editor tooling i.e LSP servers
  use 'williamboman/mason-lspconfig.nvim'                                   -- Automatically install language servers to stdpath
  use { 'hrsh7th/nvim-cmp', requires = { 'hrsh7th/cmp-nvim-lsp' } }         -- Autocompletion
  use { 'L3MON4D3/LuaSnip', requires = { 'saadparwaiz1/cmp_luasnip' } }     -- Snippet Engine and Snippet Expansion
  use 'mjlbach/onedark.nvim'                                                -- Theme inspired by Atom
  use 'nvim-lualine/lualine.nvim'                                           -- Fancier statusline
  use 'lukas-reineke/indent-blankline.nvim'                                 -- Add indentation guides even on blank lines
  use 'tpope/vim-sleuth'                                                    -- Detect tabstop and shiftwidth automatically

  -- Fuzzy Finder (files, lsp, etc)
  use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }

  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable "make" == 1 }

  -- Add custom plugins to packer from a /nvim/lua/custom/plugins.lua module
  local has_plugins, plugins = pcall(require, "custom.plugins")
  if has_plugins then plugins.setup(use) end

  if is_bootstrap then
    require('packer').sync()
  end
end)
-- stylua: ignore end

-- When we are bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the init.lua.
--
-- You'll need to restart nvim, and then it will work.
if is_bootstrap then
  print '=================================='
  print '    Plugins are being installed'
  print '    Wait until Packer completes,'
  print '       then restart nvim'
  print '=================================='
  return
end

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | PackerCompile',
  group = packer_group,
  pattern = vim.fn.expand '$MYVIMRC',
})

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
vim.o.updatetime = 250
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

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Set lualine as statusline
-- See `:help lualine.txt`
require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = 'onedark',
    component_separators = '|',
    section_separators = '',
  },
}

-- Enable Comment.nvim
require('Comment').setup()

-- Enable `lukas-reineke/indent-blankline.nvim`
-- See `:help indent_blankline.txt`
require('indent_blankline').setup {
  char = '┊',
  show_trailing_blankline_indent = false,
}

-- Gitsigns
-- See `:help gitsigns.txt`
require('gitsigns').setup {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
}

-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })

-- vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
-- vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
-- vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
-- vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
-- vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
require('nvim-treesitter.configs').setup {
  -- Add languages to be installed here that you want installed for treesitter
  ensure_installed = {'c', 'cpp', 'go', 'lua', 'python', 'rust', 'typescript'},

  highlight = { enable = true },
  indent = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',
      node_incremental = '<c-space>',
      -- TODO: I'm not sure for this one.
      scope_incremental = '<c-s>',
      node_decremental = '<c-backspace>',
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ['<leader>a'] = '@parameter.inner',
      },
      swap_previous = {
        ['<leader>A'] = '@parameter.inner',
      },
    },
  },
}

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = '[d Goto prev diagnostic' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = ']d Goto next diagnostic' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = '[e] Diagnostic float' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = '[q] Diagnostic loclist' })

-- LSP settings.
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
  -- NOTE: Remember that lua is a real programming language, and as such it is possible
  -- to define small helper and utility functions so you don't have to repeat yourself
  -- many times.
  --
  -- In this case, we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gi', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('gr', require('telescope.builtin').lsp_references)
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-S-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    if vim.lsp.buf.format then
      vim.lsp.buf.format()
    elseif vim.lsp.buf.formatting then
      vim.lsp.buf.formatting()
    end
  end, { desc = 'Format current buffer with LSP' })
end

-- nvim-cmp supports additional completion capabilities
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Setup mason so it can manage external tooling
require('mason').setup()

-- Enable the following language servers
local servers = { 'clangd', 'rust_analyzer', 'pyright', 'tsserver', 'sumneko_lua', 'eslint' }

-- Ensure the servers above are installed
require('mason-lspconfig').setup {
  ensure_installed = servers,
}

for _, lsp in ipairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- Example custom configuration for lua
--
-- Make runtime files discoverable to the server
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

require('lspconfig').sumneko_lua.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = { library = vim.api.nvim_get_runtime_file('', true) },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = { enable = false, },
    },
  },
}

-- nvim-cmp setup
local cmp = require 'cmp'
local luasnip = require 'luasnip'

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et

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
vim.keymap.set("n", "<leader>fdf", "<cmd>Telescope dir find_files<CR>", { noremap = true, silent = true })

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

-- normal gt/gT for tab nav
-- space space to navigate buffers
-- TODO: How to navigate buffers within tab?
-- Can use space space to use telescope..
vim.keymap.set("n", "<leader>bp", ":BufferlinePick<cr>", { noremap = true, silent = true })
-- vim.keymap.set("n", "]b", ":bnext<cr>", { noremap = true, silent = true })
-- vim.keymap.set("n", "[b", ":bprev<cr>", { noremap = true, silent = true })
-- vim.keymap.set("n", "[q", ":cprevious<cr>", { noremap = true, silent = true })
-- vim.keymap.set("n", "]q", ":cnext<cr>", { noremap = true, silent = true })

-- Leap.nvim overrides sS, and many visual mode keys (x, s)
-- s = cl
-- S = cc
-- v_s = v_c
-- v_S = Vc
-- v_x = v_d

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
vim.opt.list = true -- show hidden whitespace characters
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
