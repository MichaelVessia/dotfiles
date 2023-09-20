return {
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
      -- Notes
      { "<leader>nn", "core.norg.dirman.new.note", { desc = "[N]ew [N]ote" } },
    },
  },
}
