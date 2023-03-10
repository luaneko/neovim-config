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
    "buffer",
    "completion",
    "editing",
    "explorer",
    "diagnostics",
    "keymap",
    "lsp",
    "performance",
    "search",
    "session",
    "statusline",
    "testing",
    "theme",
    "tree-sitter",
    "vcs",
    "visual",
  },
}
