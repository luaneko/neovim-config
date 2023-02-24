--
-- Copyright (c) 2022 luaneko <luaneko@chiya.dev>
--
-- Use of this source code is governed by the MIT License
-- which can be found in the LICENSE file and at:
--
--   https://chiya.dev/licenses/mit.txt
--
return {
  -- more precise word motion overrides
  "chaoren/vim-wordmotion",

  -- matching keyword jumping
  {
    "andymass/vim-matchup",
    requires = "nvim-treesitter/nvim-treesitter",
    function()
      require("nvim-treesitter.configs").setup {
        matchup = {
          enable = true,
        },
      }
    end,
  },

  -- useful bracket navigation keys
  {
    "echasnovski/mini.nvim",
    function()
      require("mini.bracketed").setup {}
    end,
  },
}
