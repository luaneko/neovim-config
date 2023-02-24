--
-- Copyright (c) 2022 luaneko <luaneko@chiya.dev>
--
-- Use of this source code is governed by the MIT License
-- which can be found in the LICENSE file and at:
--
--   https://chiya.dev/licenses/mit.txt
--
return {
  -- restore last scroll position
  "farmergreg/vim-lastplace",

  -- sensible buffer options
  "tpope/vim-sleuth",

  -- nice buffer deleter
  "mhinz/vim-sayonara",

  -- another buffer deleter (required by some plugins)
  {
    "rbgrouleff/bclose.vim",
    setup = function()
      vim.g.bclose_no_plugin_maps = true
    end,
  },

  -- window size/position manager
  "simeji/winresizer",
}
