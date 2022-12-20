--
-- Copyright (c) 2022 luaneko <luaneko@chiya.dev>
--
-- Use of this source code is governed by the MIT License
-- which can be found in the LICENSE file and at:
--
--   https://chiya.dev/licenses/mit.txt
--
return {
  -- test runner
  {
    "vim-test/vim-test",
    function()
      vim.cmd([[
        let test#rust#cargotest#options = '-- --nocapture'
      ]])
    end,
  },
}
