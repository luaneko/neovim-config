--
-- Copyright (c) 2022 luaneko <luaneko@chiya.dev>
--
-- Use of this source code is governed by the MIT License
-- which can be found in the LICENSE file and at:
--
--   https://chiya.dev/licenses/mit.txt
--
return {
  -- modern fzf alternative
  {
    "nvim-telescope/telescope.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    function()
      require("telescope").setup {
        defaults = require("telescope.themes").get_ivy {
          layout_config = {
            height = 35,
            preview_width = 0.6,
          },
        },

        pickers = {
          buffers = {
            sort_lastused = true,
            mappings = {
              n = {
                ["<backspace>"] = require("telescope.actions").delete_buffer,
              },
            },
          },
        },
      }
    end,
  },

  -- telescope-based file explorer
  {
    "nvim-telescope/telescope-file-browser.nvim",
    requires = "nvim-telescope/telescope.nvim",
    function()
      require("telescope").setup {
        extensions = {
          file_browser = {
            hijack_netrw = true,
            grouped = true,
            auto_depth = true,
            select_buffer = true,
            hidden = true,
            respect_gitignore = false,
            dir_icon = " ",
            use_fd = true,
            git_status = true,
          },
        },
      }

      require("telescope").load_extension("file_browser")
    end,
  },

  -- telescope-based undo history search
  {
    "debugloop/telescope-undo.nvim",
    requires = "nvim-telescope/telescope.nvim",
    function()
      require("telescope").setup {
        extensions = {
          undo = {
            use_delta = true,
            mappings = {
              -- https://github.com/debugloop/telescope-undo.nvim/issues/16
              i = { ["<cr>"] = require("telescope-undo.actions").restore },
              n = { ["<cr>"] = require("telescope-undo.actions").restore },
            },
          },
        },
      }

      require("telescope").load_extension("undo")
    end,
  },

  -- quick buffer navigation
  {
    "ggandor/leap.nvim",
    requires = "tpope/vim-repeat",
    function()
      require("leap").add_default_mappings()
      vim.api.nvim_set_hl(0, "LeapBackdrop", { link = "Comment" })
    end,
  },

  -- peek lines without jumping
  {
    "nacro90/numb.nvim",
    function()
      require("numb").setup()
    end,
  },
}
