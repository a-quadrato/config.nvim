-------------------------------------------------------------------------------
-- Autocommands
-----------------------------------------------------------------------------
local utils = require "utils.init"
local aug = vim.api.nvim_create_augroup
local au = vim.api.nvim_create_autocmd

aug("Misc", { clear = true })

au("BufWritePre", {
  group = "Misc",
  pattern = "*",
  callback = utils.strip_trailing_whitespaces,
})

-- highlight yank
au("TextYankPost", {
  group = "Misc",
  pattern = "*",
  callback = function()
    vim.highlight.on_yank { on_visual = true }
  end,
})

-- open help on vertical split
au("FileType", {
  group = "Misc",
  pattern = "help",
  callback = function()
    vim.cmd [[wincmd L]]
  end,
})

-- highligh when staying on word
au("CursorHold", {
  group = "Misc",
  pattern = "help",
  callback = function()
    vim.cmd("call CocAction('highlight')", { silent = true })
  end,
})

-- disable stupid auto commenting on new lines
au("BufEnter", {
  group = "Misc",
  pattern = "*",
  callback = function()
    vim.cmd [[set fo-=c fo-=r fo-=o]]
  end,
})

-- return to last edit position when opening files
au("BufReadPost", {
  group = "Misc",
  pattern = "*",
  callback = function()
    vim.cmd [[ if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif ]]
  end,
})

-- enable Spelling for text files
au("BufEnter", {
  group = "Misc",
  pattern = "*",
  callback = utils.enable_spelling,
})
