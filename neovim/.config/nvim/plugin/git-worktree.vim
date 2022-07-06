lua << EOF
require("telescope").load_extension("git_worktree")
EOF

" Switch and delete
nnoremap <leader>gwt :lua require('telescope').extensions.git_worktree.git_worktrees()<cr>
" Create
nnoremap <leader>gwtn :lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>
