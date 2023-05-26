local opt = vim.opt
local g = vim.g

opt.title = true
opt.clipboard = "unnamedplus"
opt.cul = false -- cursor line

-- Indentline
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.smarttab = true

-- disable tilde on end of buffer: https://github.com/neovim/neovim/pull/8546#issuecomment-643643758
opt.fillchars = { eob = " " }

-- Searching
opt.hlsearch = true
opt.ignorecase = true
opt.incsearch = true
opt.smartcase = true
opt.grepprg = "rg --vimgrep"

-- STFU
opt.errorbells = false

-- Clean stuff
opt.undofile = true
opt.undodir = vim.fn.stdpath "data" .. "/nvim/undodir"

opt.hidden = true
opt.mouse = "a"

-- Numbers
opt.number = true
opt.relativenumber = true
opt.ruler = false

-- disable nvim intro
opt.shortmess:append "scI"

-- Vim Command Autocompletion
opt.wildmenu = true
opt.wildmode = "longest:full,full"

-- Support for them funny UTF-8 characters
opt.emoji = true

-- No chars over 80 😠
opt.colorcolumn = "80,120"

-- Don't wrap the lines 😠
opt.wrap = false

-- Don't scroll completely to the bottom
opt.scrolloff = 3

-- Spelling 🇬🇧
opt.spell = true
opt.spelllang = "en_us"

-- Performace
opt.cursorline = false
opt.cursorcolumn = false
opt.scrolljump = 5
opt.lazyredraw = false
-- opt.redrawtime = 10000
opt.synmaxcol = 180
-- opt.re = 1
-- interval for writing swap file to disk, also used by gitsigns
opt.updatetime = 250

-- for CoC
opt.hidden = true
opt.backup = false
opt.swapfile = false
opt.writebackup = false
opt.cmdheight = 1

opt.splitbelow = true
opt.splitright = true
opt.tabstop = 4
opt.termguicolors = true
opt.showtabline = 2
opt.timeoutlen = 400

g.mapleader = " "
g.gruvbox_invert_selection = "0"

g.coc_snippet_next = "<Tab>"
g.coc_snippet_prev = "<S-Tab>"

-- Do not source the default filetype.vim - we use filetype.nvim
-- As of NeoVim 8.0, filetype.lua is the new default 👍
g.do_filetype_lua = 1

-- opt.foldmethod = "expr"
-- opt.foldexpr = "nvim_treesitter#foldexpr()"
-- opt.foldlevelstart = 99
opt.syntax = "on"
