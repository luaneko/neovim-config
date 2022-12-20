--
-- Copyright (c) 2022 luaneko <luaneko@chiya.dev>
--
-- Use of this source code is governed by the MIT License
-- which can be found in the LICENSE file and at:
--
--   https://chiya.dev/licenses/mit.txt
--
return {
  -- git integration
  "tpope/vim-fugitive",

  -- show git unstaged code
  {
    "lewis6991/gitsigns.nvim",
    requires = "nvim-lua/plenary.nvim",
    function()
      require("gitsigns").setup()
    end,
  },
}
