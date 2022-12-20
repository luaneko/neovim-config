--
-- Copyright (c) 2022 luaneko <luaneko@chiya.dev>
--
-- Use of this source code is governed by the MIT License
-- which can be found in the LICENSE file and at:
--
--   https://chiya.dev/licenses/mit.txt
--
return {
  -- terminal file explorer
  {
    "francoiscabrol/ranger.vim",
    requires = "rbgrouleff/bclose.vim",
    setup = function()
      vim.g.ranger_map_keys = 0
    end,
  },
}
