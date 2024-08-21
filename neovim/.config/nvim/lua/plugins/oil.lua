return {
  "stevearc/oil.nvim",
  opts = {
    default_file_explorer = true,
  },
  -- Optional dependencies
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
  keys = {
    { "<leader>pv", ":Oil<CR>" },
    { "-", ":Oil<CR>" },
  },
}
