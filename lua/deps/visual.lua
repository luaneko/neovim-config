--
-- Copyright (c) 2022 luaneko <luaneko@chiya.dev>
--
-- Use of this source code is governed by the MIT License
-- which can be found in the LICENSE file and at:
--
--   https://chiya.dev/licenses/mit.txt
--
return {
  -- window size/position manager
  "simeji/winresizer",

  -- show line indents
  "lukas-reineke/indent-blankline.nvim",

  -- show markers on the side
  {
    "chentoast/marks.nvim",
    function()
      require("marks").setup {
        default_mappings = true,
      }
    end,
  },

  -- highlight search matches
  "romainl/vim-cool",

  -- highlight substitute matches
  "markonm/traces.vim",

  -- highlight todo comments
  {
    "folke/todo-comments.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    function()
      require("todo-comments").setup()
    end,
  },

  -- show lsp status
  {
    "j-hui/fidget.nvim",
    function()
      require("fidget").setup {
        window = {
          relative = "editor",
          blend = 0,
        },
      }
    end,
  },

  -- show git unstaged code
  {
    "lewis6991/gitsigns.nvim",
    requires = "nvim-lua/plenary.nvim",
    function()
      require("gitsigns").setup()
    end,
  },
}
