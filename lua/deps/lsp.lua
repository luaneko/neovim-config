--
-- Copyright (c) 2022 luaneko <luaneko@chiya.dev>
--
-- Use of this source code is governed by the MIT License
-- which can be found in the LICENSE file and at:
--
--   https://chiya.dev/licenses/mit.txt
--
return {
  {
    "neovim/nvim-lspconfig",
    requires = {
      "hrsh7th/cmp-nvim-lsp",
      "RRethy/vim-illuminate",
    },
    deps = {
      -- integration for non-lsp utilities
      {
        "jose-elias-alvarez/null-ls.nvim",
        requires = "nvim-lua/plenary.nvim",
        function()
          local null = require("null-ls")

          null.setup {
            sources = {
              -- web stuff
              null.builtins.formatting.prettierd,

              -- lua
              null.builtins.formatting.stylua,

              -- python
              null.builtins.formatting.black,
              null.builtins.diagnostics.flake8.with {
                -- https://github.com/jose-elias-alvarez/null-ls.nvim/issues/848#issuecomment-1119040548
                cwd = function(params)
                  return vim.fn.fnamemodify(params.bufname, ":h")
                end,
              },

              -- miscellaneous
              null.builtins.code_actions.gitsigns,
              --null.builtins.diagnostics.cspell, -- spell checker
            },
          }
        end,
      },

      -- function signature viewer
      {
        "ray-x/lsp_signature.nvim",
        function()
          require("lsp_signature").setup {
            bind = true,
            fix_pos = true,
            doc_lines = 100,
            mac_height = 100,
            hint_prefix = "",
            handler_opts = {
              border = "none",
            },
          }
        end,
      },
    },
    function()
      local function combine(...)
        local fns = { ... }
        return function(...)
          for _, fn in ipairs(fns) do
            fn(...)
          end
        end
      end

      local caps = require("cmp_nvim_lsp").default_capabilities()
      local lsp = require("lspconfig")
      local on_attach = combine(require("illuminate").on_attach)

      -- rust
      lsp.rust_analyzer.setup {
        capabilities = caps,
        on_attach = on_attach,
        settings = {
          ["rust-analyzer.cargo.runBuildScripts"] = true,
        },
      }

      -- lua
      lsp.lua_ls.setup {
        capabilities = caps,
        on_attach = combine(on_attach, function(client)
          -- use stylua formatting instead
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentRangeFormattingProvider = false
        end),
        settings = {
          Lua = {
            runtime = {
              version = "LuaJIT",
              path = {
                "?.lua",
                "?/init.lua",
                vim.fn.expand("~/.luarocks/share/lua/5.1/?.lua"),
                vim.fn.expand("~/.luarocks/share/lua/5.1/?/init.lua"),
                "/usr/share/5.1/?.lua",
                "/usr/share/lua/5.1/?/init.lua",
              },
            },
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = {
                vim.api.nvim_get_runtime_file("", true),
                vim.fn.expand("~/.luarocks/share/lua/5.1"),
                "/usr/share/lua/5.1",
              },
            },
            telemetry = {
              enable = false,
            },
          },
        },
      }

      -- typescript
      lsp.tsserver.setup {
        capabilities = caps,
        on_attach = combine(on_attach, function(client)
          -- use prettier formatting instead
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentRangeFormattingProvider = false
        end),
      }

      -- c#
      lsp.omnisharp.setup {
        capabilities = caps,
        cmd = { "/usr/bin/omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
        on_attach = on_attach,
      }

      -- python
      lsp.pyright.setup {
        capabilities = caps,
        on_attach = on_attach,
      }
    end,
  },
}
