--
-- Copyright (c) 2022 luaneko <luaneko@chiya.dev>
--
-- Use of this source code is governed by the MIT License
-- which can be found in the LICENSE file and at:
--
--   https://chiya.dev/licenses/mit.txt
--
return {
  -- show line indents
  "Yggdroot/indentLine",

  -- show vim markers on the side
  "kshenoy/vim-signature",

  -- highlight yanked text
  "machakann/vim-highlightedyank",

  -- highlight search matches
  "romainl/vim-cool",

  -- highlight substitute matches
  "markonm/traces.vim",

  -- highlight brackets in rainbow
  {
    "p00f/nvim-ts-rainbow",
    requires = "nvim-treesitter/nvim-treesitter",
    function()
      require("nvim-treesitter.configs").setup {
        rainbow = {
          enable = true,
          extended_mode = true,
        },
      }
    end,
  },

  -- highlight todo comments
  {
    "folke/todo-comments.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "folke/trouble.nvim",
      "nvim-telescope/telescope.nvim",
    },
    function()
      require("todo-comments").setup()
    end,
  },

  -- highlight hex colors
  {
    "norcalli/nvim-colorizer.lua",
    function()
      require("colorizer").setup()
    end,
  },

  -- hide away distracting code
  {
    "folke/zen-mode.nvim",
    requires = {
      { "folke/twilight.nvim", requires = "nvim-treesitter/nvim-treesitter" },
    },
    function()
      require("zen-mode").setup()
    end,
  },
}
