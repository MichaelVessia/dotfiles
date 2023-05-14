return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- This will automatically install tailwindcss for us without having to do it inside Mason
        tailwindcss = {},
      },
    },
  },
  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      user_default_options = {
        -- Add colors to tailwind classes inside html or jsx
        tailwind = true,
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      { "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
    },
    opts = function(_, opts)
      -- combine base lazyvim formatter plus tailwind colors
      -- original lazyvim kind icon formatter
      local format_kinds = opts.formatting.format
      opts.formatting.format = function(entry, item)
        format_kinds(entry, item) -- add icons
        return require("tailwindcss-colorizer-cmp").formatter(entry, item) -- add colors to tailwind clases
      end
    end,
  },
}
