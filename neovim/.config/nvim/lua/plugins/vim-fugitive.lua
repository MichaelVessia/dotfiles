-- fugitive.vim: A Git wrapper so awesome, it should be illegal
return {
  {
    "tpope/vim-fugitive",
    lazy = false,
    keys = {
      { "<leader>gp", ":Git push -u origin HEAD<cr>", { desc = "[G]it [P]ush" } },
      { "<leader>gpn", ":Git push -u origin HEAD --no-verify<cr>", { desc = "[G]it [P]ush [N]o verify" } },
      { "<leader>gF", ":Git pull<cr>", { desc = "[G]it [F]etch (Pull)" } },
      { "<leader>gd", ":Git diff<cr>", { desc = "[G]it [D]iff" } },
    },
  },
}
