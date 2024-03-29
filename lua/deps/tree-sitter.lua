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
    "nvim-treesitter/nvim-treesitter",
    config = function()
      vim.cmd("TSUpdate")
    end,
    function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = {
          "bash",
          "c",
          "c_sharp",
          "clojure",
          "cmake",
          "commonlisp",
          "cpp",
          "css",
          "cuda",
          "d",
          "dart",
          "dockerfile",
          "dot",
          "elixir",
          "erlang",
          "fennel",
          "fish",
          "gitattributes",
          "gitignore",
          "glsl",
          "go",
          "graphql",
          "hjson",
          "hlsl",
          "html",
          "http",
          "java",
          "javascript",
          "jsdoc",
          "json",
          "json5",
          "julia",
          "kotlin",
          "lalrpop",
          "latex",
          "llvm",
          "lua",
          "make",
          "markdown",
          "nix",
          "ocaml",
          "pascal",
          "perl",
          "php",
          "prisma",
          "proto",
          "pug",
          "python",
          "r",
          "regex",
          "ruby",
          "rust",
          "scala",
          "scheme",
          "scss",
          "sql",
          "svelte",
          "swift",
          "teal",
          "toml",
          "tsx",
          "typescript",
          "vala",
          "vim",
          "vue",
          "wgsl",
          "yaml",
          "zig",
        },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      }
    end,
  },
}
