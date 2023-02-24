--
-- Copyright (c) 2023 chiya.dev
--
-- Use of this source code is governed by the MIT License
-- which can be found in the LICENSE file and at:
--
--   https://chiya.dev/licenses/mit.txt
--
vim.g.mapleader = ";"

local map = vim.keymap.set
local telescope = require("telescope.builtin")

map("n", "'", "`")
map("n", "<space>", "@@")

map("n", "<c-h>", "<c-w>h")
map("n", "<c-j>", "<c-w>j")
map("n", "<c-k>", "<c-w>k")
map("n", "<c-l>", "<c-w>l")

map("n", "K", vim.lsp.buf.hover)
map("n", "<leader>;", vim.lsp.buf.code_action)
map("n", "<leader>:", vim.lsp.buf.format)
map("n", "<leader>r", vim.lsp.buf.rename)
map("n", "<leader>w", ":lua vim.lsp.buf.format()<cr>:w<cr>")
map("n", "<leader>u", require("telescope").extensions.undo.undo)

map("n", "<leader>c", telescope.commands)
map("n", "<leader>e", telescope.diagnostics)
map("n", "<leader>d", telescope.lsp_document_symbols)
map("n", "<leader>D", telescope.lsp_workspace_symbols)

map("n", "gd", telescope.lsp_definitions)
map("n", "gr", telescope.lsp_references)
map("n", "gi", telescope.lsp_implementations)

map("n", "<leader>f", telescope.find_files)
map("n", "<leader>-", ":!open %:p:h<cr><cr>")
map("n", "-", require("telescope").extensions.file_browser.file_browser)
map("n", "?", telescope.live_grep)

map("n", "<tab>", telescope.buffers)
map("n", "<s-tab>", telescope.oldfiles)
map("n", "<backspace>", ":q<cr>")
map("n", "<s-backspace>", ":qa<cr>")

map("x", "sa", "<plug>(operator-sandwich-add)")
map("x", "sd", "<plug>(operator-sandwich-delete)")
map("x", "sr", "<plug>(operator-sandwich-replace)")
