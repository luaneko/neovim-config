--
-- Copyright (c) 2022 luaneko <luaneko@chiya.dev>
--
-- Use of this source code is governed by the MIT License
-- which can be found in the LICENSE file and at:
--
--   https://chiya.dev/licenses/mit.txt
--
local o = vim.opt

o.hidden = true
o.fsync = true
o.shortmess = o.shortmess + "AIc"
o.completeopt = "menu,menuone,noselect"
o.title = true
o.autoindent = true
o.incsearch = true
o.hlsearch = true
o.ignorecase = true
o.infercase = true
o.smartcase = true
o.wrapscan = true
o.scrolloff = 4
o.number = true
o.mouse = "a"
o.updatetime = 100
o.signcolumn = "yes"
o.termguicolors = true
o.laststatus = 3
o.cursorline = true
o.showtabline = 1
o.autowrite = true
o.pumheight = 0
o.splitbelow = true
o.splitright = true
o.startofline = true
o.wrap = false
o.expandtab = true
o.shiftwidth = 2
o.tabstop = 4
o.undofile = true
o.list = true
o.relativenumber = true
o.showmode = false
o.switchbuf = "usetab,newtab"
o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"

-- hide cursorline from inactive windows
vim.cmd([[
  function WinEnterSaveCul()
    let w:cul = &l:cul
    let &l:cul = 0
  endfunction

  function WinEnterRestoreCul()
    let &l:cul = get(w:, "cul", &l:cul)
  endfunction

  augroup WinToggleStuff
    au!
    au WinEnter * call WinEnterRestoreCul()
    au WinLeave * call WinEnterSaveCul()
  augroup end
]])

-- highlight yanked text
vim.cmd([[
  augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank({ higroup = "Cursor", timeout = 500 })
  augroup END
]])
