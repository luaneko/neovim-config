--
-- Copyright (c) 2022 luaneko <luaneko@chiya.dev>
--
-- Use of this source code is governed by the MIT License
-- which can be found in the LICENSE file and at:
--
--   https://chiya.dev/licenses/mit.txt
--
return {
  -- statusline override
  {
    "nvim-lualine/lualine.nvim",
    requires = { "rmagatti/auto-session" },
    function()
      require("lualine").setup {
        options = {
          theme = "ayu",
          icons_enabled = true,
          section_separators = "",
          component_separators = "",
          globalstatus = true,
          refresh = {
            statusline = 200,
          },
        },

        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = {
            { "filename", path = 1 },
            "filesize",
          },
          lualine_x = {
            require("auto-session-library").current_session_name,
            "encoding",
            { "filetype", colored = true },
          },
          lualine_y = { "location", "progress" },
          lualine_z = { "hostname" },
        },

        inactive_sections = {},
        extensions = {},
      }
    end,
  },
}
