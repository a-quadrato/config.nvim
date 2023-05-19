-------------------------------------------------------------------------------
-- Autocommands
-----------------------------------------------------------------------------
local utils = require "utils.init"
local aug = vim.api.nvim_create_augroup

aug("Misc", { clear = true })

vim.api.nvim_create_autocmd("BufWritePre", {
  group = "Misc",
  pattern = "*",
  callback = utils.strip_trailing_whitespaces,
})

-- highlight yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = "Misc",
  pattern = "*",
  callback = function()
    vim.highlight.on_yank { on_visual = true }
  end,
})

-- open help on vertical split
vim.api.nvim_create_autocmd("FileType", {
  group = "Misc",
  pattern = "help",
  callback = function()
    vim.cmd [[wincmd L]]
  end,
})

-- highlight when staying on word
vim.api.nvim_create_autocmd("CursorHold", {
  group = "Misc",
  pattern = "help",
  callback = function()
    vim.cmd "call CocAction('highlight')"
  end,
})

-- disable stupid auto commenting on new lines
vim.api.nvim_create_autocmd("BufEnter", {
  group = "Misc",
  pattern = "*",
  callback = function()
    vim.cmd [[set fo-=c fo-=r fo-=o]]
  end,
})

-- return to last edit position when opening files
vim.api.nvim_create_autocmd("BufReadPost", {
  group = "Misc",
  pattern = "*",
  callback = function()
    vim.cmd [[ if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif ]]
  end,
})

-- enable Spelling for text files
vim.api.nvim_create_autocmd("FileType", {
  group = "Misc",
  pattern = "txt,markdown,postscript,tex,latex",
  callback = utils.enable_spelling,
})
