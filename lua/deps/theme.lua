--
-- Copyright (c) 2022 luaneko <luaneko@chiya.dev>
--
-- Use of this source code is governed by the MIT License
-- which can be found in the LICENSE file and at:
--
--   https://chiya.dev/licenses/mit.txt
--
return {
  {
    "Shatur/neovim-ayu",
    function()
      local ayu = require("ayu")

      ayu.setup {
        overrides = {
          Normal = { bg = "None" },
        },
      }

      ayu.colorscheme()
    end,
  },

  -- lsp color fallbacks
  "folke/lsp-colors.nvim",

  -- neovim builtin input and select override
  {
    "stevearc/dressing.nvim",
    requires = { "nvim-telescope/telescope.nvim" },
    function()
      require("dressing").setup {
        select = {
          backend = { "telescope" },
          telescope = require("telescope.themes").get_ivy {},
        },
      }
    end,
  },
}
