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
    "catppuccin/nvim",
    function()
      require("catppuccin").setup {
        flavour = "mocha",
        background = {
          light = "latte",
          dark = "mocha",
        },
        transparent_background = true,
        term_colors = true,
        integrations = {
          cmp = true,
          mini = true,
          leap = true,
          gitsigns = true,
          fidget = true,
          telescope = true,
          markdown = true,
          sandwich = true,
          indent_blankline = {
            enabled = true,
          },
          native_lsp = {
            enabled = true,
          },
        },
      }

      vim.cmd.colorscheme("catppuccin")
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
