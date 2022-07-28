call plug#begin()

" Fuzzy finder & other goodies
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" Treesitter stuff
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-context'

" Undo Visualizer
Plug 'mbbill/undotree'

" Color scheme
"Plug 'gruvbox-community/gruvbox'
Plug 'sickill/vim-monokai'

" Git Utilities
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/gv.vim'

" Git Worktrees
Plug 'ThePrimeagen/git-worktree.nvim'

" COC
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Filetree
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
Plug 'ryanoasis/vim-devicons'
Plug 'adelarsq/vim-devicons-emoji'
Plug 'ryanoasis/nerd-fonts'

" Tmux Support
Plug 'christoomey/vim-tmux-navigator'

" Change working directory
Plug 'airblade/vim-rooter'

" Status bar
Plug 'itchyny/lightline.vim'

" Indentation
Plug 'tpope/vim-sleuth'
Plug 'gpanders/editorconfig.nvim'

" Keybind cheatsheet
Plug 'folke/which-key.nvim'

" Markdown Support
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}


call plug#end()
