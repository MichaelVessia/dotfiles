return {
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
      {
        "<leader>fx",
        function()
          require("telescope.builtin").resume()
        end,
        desc = "Open previous window",
      },
    },
  },
}
