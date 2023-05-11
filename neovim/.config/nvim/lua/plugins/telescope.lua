return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
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
