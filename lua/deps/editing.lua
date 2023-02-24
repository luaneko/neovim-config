--
-- Copyright (c) 2022 luaneko <luaneko@chiya.dev>
--
-- Use of this source code is governed by the MIT License
-- which can be found in the LICENSE file and at:
--
--   https://chiya.dev/licenses/mit.txt
--
return {
  -- code commenter
  {
    "echasnovski/mini.nvim",
    function()
      require("mini.comment").setup {}
    end,
  },

  -- case coercion
  "tpope/vim-abolish",

  -- close brackets automatically
  {
    "windwp/nvim-autopairs",
    function()
      require("nvim-autopairs").setup()
    end,
  },

  -- close html tags automatically
  {
    "windwp/nvim-ts-autotag",
    requires = "nvim-treesitter/nvim-treesitter",
    function()
      require("nvim-ts-autotag").setup {}
    end,
  },

  -- text quoter
  {
    "machakann/vim-sandwich",
    setup = function()
      vim.g.sandwich_no_default_key_mappings = true
      vim.g.operator_sandwich_no_default_key_mappings = true
    end,
  },
}
