return {
  -- add dirbuf for editing filesystem like it's a file
  {
    "elihunter173/dirbuf.nvim",
    keys = {
      { "<leader>pv", ":Dirbuf<CR>" },
    },
  },
  {
    "tpope/vim-fugitive",
    keys = {
      { "<leader>gs", ":G<cr>", { desc = "[G]it [S]tatus" } },
      { "<leader>gl", ":Git blame<cr>", { desc = "[G]it B[l]ame" } },
      { "<leader>gr", ":GBrowse<cr>", { desc = "[G]it [R]epo" } },
      { "<leader>gp", ":Git push -u origin HEAD<cr>", { desc = "[G]it [P]ush" } },
      { "<leader>gpn", ":Git push -u origin HEAD --no-verify<cr>", { desc = "[G]it [P]ush [N]o verify" } },
      { "<leader>gf", ":Git pull<cr>", { desc = "[G]it [F]etch (Pull)" } },
      { "<leader>gd", ":Git diff<cr>", { desc = "[G]it [D]iff" } },
    },
  },

  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    opts = {
      load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.concealer"] = {}, -- Adds pretty icons to your documents
        ["core.dirman"] = {
          config = {
            workspaces = {
              work = "~/notes/work",
              home = "~/notes/home",
            },
          },
        },
      },
    },
    dependencies = { { "nvim-lua/plenary.nvim" } },
    keys = {
      -- workspaces
      { "<leader>nd", ":e ~/notes<CR>", { desc = "[N]ote [D]ir" } },
      { "<leader>nwh", ":Neorg workspace home<CR>", { desc = "[N]ote [W]orkspace [H]ome" } },
      { "<leader>nww", ":Neorg workspace work<CR>", { desc = "[N]ote [W]orkspace [W]ork" } },
      -- metadata
      { "<leader>nm", ":Neorg inject-metadata<CR>", { desc = "Inject [N]ote [M]etadata" } },
      -- journaling
      { "<leader>njt", ":Neorg journal today<CR>", { desc = "[N]ote [J]ournal [T]oday" } },
      { "<leader>njy", ":Neorg journal yesterday<CR>", { desc = "[N]ote [J]ournal [Y]esterday" } },
      { "<leader>njm", ":Neorg journal tomorrow<CR>", { desc = "[N]ote [J]ournal Tom[M]orrow" } },
      -- toc
      { "<leader>ntocs", ":Neorg toc split<CR>", { desc = "[N]ote [TOC] [S]plit" } },
    },
  },
  -- disable leap
  { "ggandor/leap.nvim", enabled = false },
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      {
        "<leader>fg",
        function()
          require("telescope.builtin").live_grep({ cwd = require("lazy.core.config").options.root })
        end,
        desc = "Grep (root dir)",
      },
      {
        "<leader>fG",
        function()
          require("telescope.builtin").live_grep()
        end,
        desc = "Grep (cwd)",
      },
    },
    -- change some options
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
      },
    },
  },
}
