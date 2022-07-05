" If vimrc exists inside a directory, vim will use it
set exrc
" Big block cursor
set guicursor=
set relativenumber
" Show current line number instead of 0
set nu
" Search highlighting off
set nohlsearch
" Keep things open in the background
set hidden
set noerrorbells

" Should be handled by vim-sleuth
" set tabstop=4 softtabstop=4
" set shiftwidth=4
" set expandtab
" set smartindent
"
" No text wrapping
set nowrap

" Highlights as you search (useful for regex)
set incsearch
set termguicolors
" Starts scrolling when you are near the bottom of the screen
set scrolloff=8
set noshowmode
set completeopt=menuone,noinsert,noselect
set colorcolumn=80
set signcolumn=yes

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Font configuration
" set guifont=JetBrains_Mono_NL_Regular_Nerd_font_Complete_Mono:h14

""" KEYBINDS
"mode lhs rhs

"n - normal
"nore no recursive
"map
"
let mapleader = " "
