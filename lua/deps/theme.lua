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
    "arcticicestudio/nord-vim",
    setup = function()
      vim.g.nord_bold = 1
      vim.g.nord_italic = 1
      vim.g.nord_italic_comments = 1
      vim.g.nord_underline = 1
    end,
    function()
      vim.cmd("colorscheme nord")
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
