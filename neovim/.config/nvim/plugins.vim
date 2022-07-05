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


call plug#end()

" Source individual config files for each plugin
" TODO: Possibly iterate over all .vim files in dir?
source ~/.config/nvim/plugins/chadtree.vim
source ~/.config/nvim/plugins/coc.vim
source ~/.config/nvim/plugins/gitgutter.vim
source ~/.config/nvim/plugins/lightline.vim
source ~/.config/nvim/plugins/telescope.vim
source ~/.config/nvim/plugins/treesitter.vim
source ~/.config/nvim/plugins/undotree.vim
source ~/.config/nvim/plugins/vim-tmux-navigator.vim
