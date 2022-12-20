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
    "numToStr/Comment.nvim",
    requires = { "JoosepAlviste/nvim-ts-context-commentstring" },
    function()
      require("Comment").setup {
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      }
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
      require("nvim-ts-autotag").setup()
    end,
  },

  -- text quoter
  {
    "machakann/vim-sandwich",
    requires = "svermeulen/vimpeccable",
    setup = function()
      vim.g.sandwich_no_default_key_mappings = true
      vim.g.operator_sandwich_no_default_key_mappings = true
    end,
    function()
      local map = require("vimp")

      -- https://github.com/machakann/vim-sandwich/blob/master/plugin/operator/sandwich.vim#L82
      -- avoid key conflict with lightspeed by only mapping visual mode
      map.xmap("sa", "<plug>(operator-sandwich-add)")
      map.xmap("sd", "<plug>(operator-sandwich-delete)")
      map.xmap("sr", "<plug>(operator-sandwich-replace)")
    end,
  },
}
