nnoremap <C-p> :Telescope<cr>
" Find files using Telescope command-line sugar.
nnoremap <leader>ff :lua require("telescope.builtin").find_files()<cr>
nnoremap <leader>fh :lua require("telescope.builtin").find_files({ hidden=true })<cr>
nnoremap <leader>fg :lua require("telescope.builtin").live_grep()<cr>
nnoremap <leader>fb :lua require("telescope.builtin").buffers()<cr>
"nnoremap <Leader>fr :lua require("telescope.builtin").find_references(require("telescope.themes").get_cursor({}))<cr>

