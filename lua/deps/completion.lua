--
-- Copyright (c) 2022 luaneko <luaneko@chiya.dev>
--
-- Use of this source code is governed by the MIT License
-- which can be found in the LICENSE file and at:
--
--   https://chiya.dev/licenses/mit.txt
--
return {
  -- autocompletion engine
  {
    "hrsh7th/nvim-cmp",
    requires = {
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
    },
    function()
      local cmp = require("cmp")

      cmp.setup {
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },

        sources = cmp.config.sources {
          { name = "nvim_lsp" },
        },
        {
          { name = "buffer" },
        },

        mapping = {
          ["<tab>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
          ["<s-tab>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
          ["<down>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },
          ["<up>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
          ["<c-d>"] = cmp.mapping.scroll_docs(-4),
          ["<c-f>"] = cmp.mapping.scroll_docs(4),
          ["<c-space>"] = cmp.mapping.complete(),
          ["<c-e>"] = cmp.mapping.close(),
          ["<cr>"] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          },
        },
      }

      cmp.setup.cmdline("/", {
        sources = {
          { name = "buffer" },
        },
      })

      cmp.setup.cmdline(":", {
        sources = cmp.config.sources {
          { name = "path" },
        },
        {
          { name = "cmdline" },
        },
      })
    end,
  },
}
