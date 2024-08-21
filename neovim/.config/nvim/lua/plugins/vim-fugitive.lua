return {
  {
    "tpope/vim-fugitive",
    lazy = false,
    keys = {
      -- Maybe I can muscle memory myself into using :G
      --{ "<leader>gs", ":G<cr>", { desc = "[G]it [S]tatus" } },
      --{ "<leader>gl", ":Git blame<cr>", { desc = "[G]it B[l]ame" } },
      { "<leader>gr", ":GBrowse<cr>", { desc = "[G]it [R]epo" } },
      { "<leader>gp", ":Git push -u origin HEAD<cr>", { desc = "[G]it [P]ush" } },
      { "<leader>gpn", ":Git push -u origin HEAD --no-verify<cr>", { desc = "[G]it [P]ush [N]o verify" } },
      --{ "<leader>gf", ":Git pull<cr>", { desc = "[G]it [F]etch (Pull)" } },
      { "<leader>gd", ":Git diff<cr>", { desc = "[G]it [D]iff" } },
    },
  },
}
