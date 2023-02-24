--
-- Copyright (c) 2022 luaneko <luaneko@chiya.dev>
--
-- Use of this source code is governed by the MIT License
-- which can be found in the LICENSE file and at:
--
--   https://chiya.dev/licenses/mit.txt
--
return {
  -- more precise word motion overrides
  "chaoren/vim-wordmotion",

  -- matching keyword jumping
  {
    "andymass/vim-matchup",
    requires = "nvim-treesitter/nvim-treesitter",
    function()
      require("nvim-treesitter.configs").setup {
        matchup = {
          enable = true,
        },
      }
    end,
  },

  -- useful bracket navigation keys
  {
    "echasnovski/mini.nvim",
    function()
      require("mini.bracketed").setup {}
    end,
  },

  -- custom keymap
  {
    "svermeulen/vimpeccable",
    function()
      vim.g.mapleader = ";"

      local map = require("vimp")
      map.unmap_all()
      map.always_override = true

      -- config
      map.nmap({ "silent" }, "<leader>`", ":edit ~/.config/nvim/init.lua<cr>")

      -- lsp
      map.nmap({ "silent" }, "gd", ":Telescope lsp_definitions<cr>")
      map.nmap({ "silent" }, "gi", ":Telescope lsp_implementations<cr>")
      map.nmap({ "silent" }, "gr", ":Telescope lsp_references<cr>")
      map.nnoremap({ "silent" }, "[g", vim.diagnostic.goto_prev)
      map.nnoremap({ "silent" }, "]g", vim.diagnostic.goto_next)
      map.nnoremap({ "silent" }, "K", vim.lsp.buf.hover)

      map.nmap({ "silent" }, "<leader>e", ":Telescope diagnostics<cr>")
      map.nmap({ "silent" }, "<leader>d", ":Telescope lsp_document_symbols<cr>")
      map.nmap({ "silent" }, "<leader>D", ":Telescope lsp_dynamic_workspace_symbols<cr>")
      map.nnoremap({ "silent" }, "<leader>;", vim.lsp.buf.code_action)
      map.vnoremap({ "silent" }, "<leader>;", vim.lsp.buf.range_code_action)
      map.nnoremap({ "silent" }, "<leader>:", vim.lsp.buf.format)
      map.nnoremap({ "silent" }, "<leader>r", vim.lsp.buf.rename)

      -- testing
      map.nmap({ "silent" }, "<leader>t", ":TestFile<cr>")
      map.nmap({ "silent" }, "<leader>T", ":TestSuite<cr>")

      -- telescope
      map.nmap({ "silent" }, "?", ":Telescope live_grep<cr>")
      map.nmap({ "silent" }, "<leader>f", ":Telescope find_files<cr>")
      map.nmap({ "silent" }, "<leader>c", ":Telescope commands<cr>")

      -- git
      map.nmap({ "silent" }, "<leader>gg", ":Git<cr>")
      map.nmap({ "silent" }, "<leader>gb", ":Git blame<cr>")
      map.nmap({ "silent" }, "<leader>gc", ":Git commit<cr>")
      map.nmap({ "silent" }, "<leader>gp", ":Git push<cr>")
      map.nmap({ "silent" }, "<leader>gd", ":Gdiffsplit<cr>")
      map.nmap({ "silent" }, "<leader>gl", ":Gclog<cr>")

      -- ranger
      map.nmap({ "silent" }, "-", ":Ranger<cr>")
      -- map.nnoremap({ "silent" }, "-", function()
      --   require("telescope").extensions.file_browser.file_browser({})
      -- end)
      map.nmap({ "silent" }, "<leader>-", ":!open %:p:h<cr><cr>")

      -- view management
      map.nmap({ "silent" }, "<tab>", ":Telescope buffers<cr>")
      map.nmap({ "silent" }, "<s-tab>", "<c-^>")

      map.nmap({ "silent" }, "H", ":tabp<cr>")
      map.nmap({ "silent" }, "L", ":tabn<cr>")
      map.nmap({ "silent" }, "<leader>n", ":tabnew<cr>")
      map.nmap({ "silent" }, "<backspace>", ":Sayonara<cr>")

      map.nmap({ "silent" }, "<c-h>", "<c-w>h")
      map.nmap({ "silent" }, "<c-j>", "<c-w>j")
      map.nmap({ "silent" }, "<c-k>", "<c-w>k")
      map.nmap({ "silent" }, "<c-l>", "<c-w>l")

      -- zen
      map.nmap({ "silent" }, "<leader>z", ":ZenMode<cr>")

      -- miscellaneous
      map.nmap({ "silent" }, "<space>", "@@")
      map.nmap({ "silent" }, "<leader>u", ":UndotreeToggle<cr>")
      map.nmap({ "silent" }, "<leader>H", ":Hexmode<cr>")
      map.nmap({ "silent" }, "<leader>1", ":syntax sync fromstart<cr>")
      -- map.nmap({ "silent" }, "<leader>m", ":TSPlaygroundToggle<cr>")
      -- map.nmap({ "silent" }, "<leader>M", ":TSHighlightCapturesUnderCursor<cr>")

      -- other extensions
      map.noremap("'", "`")

      map.nmap({ "silent" }, "<leader>w", ":lua vim.lsp.buf.format()<cr>:w<cr>")
    end,
  },
}
