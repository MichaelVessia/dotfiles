return {
  -- disable search plugins which modify default vim binds like s, f, t, and /
  { "ggandor/leap.nvim", enabled = false },
  { "ggandor/flit.nvim", enabled = false },
  { "folke/flash.nvim", enabled = false },
  -- disable gitsigns since it has so many conflicts with fugitive
  -- { "lewis6991/gitsigns.nvim", enabled = false },
  -- disable autopairs because I like typing my own quotes
  { "echasnovski/mini.pairs", enabled = false },
  { "goolord/alpha-nvim", enabled = false },
}
