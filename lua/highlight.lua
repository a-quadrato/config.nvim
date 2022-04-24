vim.highlight.create("ColorColumn", { ctermbg = 0, guibg = "#282828" })
vim.highlight.create("Pmenu", { guibg = "#1d2021", guifg = "white" })
vim.highlight.create("Comment", { gui = "italic", cterm = "italic" }) -- popup menu colors
vim.highlight.create("Search", { guibg = "#b16286", guifg = "#ebdbb2" }) -- search string highlight color
vim.highlight.create("NonText", { guifg = "#3C3836" }) -- mask ~ on empty lines
-- vim.highlight.clear('CursorLineNr')                           -- use the theme color for relativenumber
vim.highlight.create("CursorLineNr", { gui = "bold" }) -- make relativenumber bol
vim.highlight.create("SpellBad", { guifg = "NONE", gui = "bold,undercurl" }) -- misspelled words

-- colors for git, especially gutter
vim.highlight.create("DiffAdd", { guibg = "#3C3836", guifg = "#b8bb26", gui = "bold", cterm = "bold" })
vim.highlight.create("DiffChange", { guibg = "#3C3836", guifg = "#fabd2f", gui = "bold", cterm = "bold" })
vim.highlight.create("DiffRemoved", { guibg = "#3C3836", guifg = "#fb4934", gui = "bold", cterm = "bold" })

-- coc multi cursor highlight color
vim.highlight.create("CocCursorRange", { guibg = "#b16286", guifg = "#ebdbb2" })
