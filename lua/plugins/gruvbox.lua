local colors = require("gruvbox").palette
require("gruvbox").setup {
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = true,
    comments = true,
    operators = false,
    folds = true,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "hard", -- can be "hard", "soft" or empty string
  overrides = {
    SignColumn = { bg = colors.dark0_hard },
    DiffAdd = { bg = colors.dark0_hard, fg = colors.bright_green, reverse = false },
    DiffChange = { bg = colors.dark0_hard, fg = colors.bright_yellow, reverse = false },
    DiffRemoved = { bg = colors.dark0_hard, fg = colors.bright_red, reverse = true },
    -- DiffDelete = { bg = colors.dark0_hard, fg = colors.bright_red, reverse = true },
    CocCursorRange = { bg = colors.neutral_purple, fg = colors.light1 },
    -- CocErrorLine = { bg = colors.dark0_hard, fg = colors.bright_red },
    CocDiagnosticsError = { bg = colors.dark0_hard, fg = colors.bright_red },
    CocDiagnosticsHint = { bg = colors.dark0_hard, fg = colors.bright_red },
    CocDiagnosticsWarning = { bg = colors.dark0_hard, fg = colors.bright_orange },
    CocDiagnosticsInfo = { bg = colors.dark0_hard, fg = colors.bright_blue },
    -- ColorColumn = { bg = colors.dark0_hard },
    FgCocHintSignBgSignColumn = { bg = colors.dark1, fg = colors.bright_blue },
    Pmenu = { bg = colors.dark0_hard, fg = "white" },
    Comment = { italic = true }, -- popup menu colors
    Search = { bg = colors.neutral_purple, fg = colors.light1 }, -- search string highlight color
    NonText = { fg = colors.dark1 }, -- mask ~ on empty lines
    CursorLineNr = { bold = true }, -- make relativenumber bol
    SpellBad = { bold = true, undercurl = true }, -- misspelled words
  },
}
vim.cmd "colorscheme gruvbox"
