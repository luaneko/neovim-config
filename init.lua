--
-- Copyright (c) 2022 luaneko <luaneko@chiya.dev>
--
-- Use of this source code is governed by the MIT License
-- which can be found in the LICENSE file and at:
--
--   https://chiya.dev/licenses/mit.txt
--
require("bootstrap")
require("options")
require("dep") {
  modules = {
    prefix = "deps.",
    "completion",
    "editing",
    "lsp",
    "search",
    "session",
    "statusline",
    "theme",
    "tree-sitter",
    "visual",
  },
}
require("keymap")
