--
-- Copyright (c) 2022 luaneko <luaneko@chiya.dev>
--
-- Use of this source code is governed by the MIT License
-- which can be found in the LICENSE file and at:
--
--   https://chiya.dev/licenses/mit.txt
--
return {
  -- session management
  {
    "rmagatti/auto-session",
    function()
      require("auto-session").setup {
        log_level = "error",
        -- auto_session_use_git_branch = true,
      }
    end,
    deps = {
      {
        "rmagatti/session-lens",
        requires = { "nvim-telescope/telescope.nvim" },
        function()
          require("session-lens").setup {
            theme_conf = require("telescope.themes").get_ivy {},
          }

          require("telescope").load_extension("session-lens")
        end,
      },
    },
  },

  -- restore last scroll position
  "farmergreg/vim-lastplace",

  -- sensible buffer options
  "tpope/vim-sleuth",
}
