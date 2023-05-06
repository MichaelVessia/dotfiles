return {
  -- disable leap and flit which both override default vim binds
  { "ggandor/leap.nvim", enabled = false },
  { "ggandor/flit.nvim", enabled = false },
  -- disable gitsigns since it has so many conflicts with fugitive
  { "lewis6991/gitsigns.nvim", enabled = false },
}
