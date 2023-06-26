local status_line_bg = "#1d2021"
local tree_fg = "#ebdbb2"

local navic = require "nvim-navic"
local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand "%:t") ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
}

-- diff_source from gitsigns
local function diff_source()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed,
    }
  end
end

-- components

local start_block = {
  function()
    return "▊"
  end,
  padding = { left = 0, right = 1 }, -- We don't need space before this
  color = { bg = status_line_bg },
}

local mode = {
  function()
    return ""
  end,
  padding = { right = 1 },
  color = { bg = status_line_bg },
}

local filename = {
  "filename",
  cond = conditions.buffer_not_empty,
  color = { gui = "bold", bg = status_line_bg },
}

local location = { "location", color = { gui = "bold" } }

local progress = { "progress" }

local gps = {
  function()
    print "hello calling navic gps heloooo"
    return navic.get_location()
  end,
  cond = function()
    return navic.is_available()
  end,
}

local diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  symbols = { error = " ", warn = " ", info = " ", hint = " " },
}
local diff = {
  "diff",
  source = diff_source,
  symbols = { added = "  ", modified = " ", removed = " " },
  cond = conditions.hide_in_width,
}

local branch = {
  "b:gitsigns_head",
  icon = " ",
  color = { gui = "bold" },
  cond = conditions.hide_in_width,
}

-- TODO maybe replace previous lsp_client_name function with something that works with CoC

local treesitter = {
  function()
    local b = vim.api.nvim_get_current_buf()
    if next(vim.treesitter.highlighter.active[b]) then
      return ""
    end
    return ""
  end,
  color = {
    fg = tree_fg,
  },
  cond = conditions.hide_in_width,
}

local filesize = {
  "filesize",
  cond = conditions.buffer_not_empty,
}
local filetype = {
  "filetype",
  fmt = string.upper,
  color = { bg = status_line_bg, gui = "bold" },
}
local encoding = {
  "o:encoding", -- option component same as &encoding in viml
  fmt = string.upper, -- I'm not sure why it's upper case either ;)
  cond = conditions.hide_in_width,
  color = { bg = status_line_bg, gui = "bold" },
}

local fileformat = {
  "fileformat",
  fmt = string.upper,
  icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
  color = { bg = status_line_bg, gui = "bold" },
}
-- end with  block
local end_block = {
  function()
    return "▊"
  end,
  padding = { left = 1, right = 0 }, -- We don't need space before this

  color = { bg = status_line_bg },
}

require("lualine").setup {
  options = {
    icons_enabled = true,
    theme = "auto",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = { "NvimTree", "alpha" },
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {},
    lualine_b = { start_block, mode, filename },
    lualine_c = { progress, location, diagnostics, gps },
    lualine_x = { diff, branch, treesitter, filesize },
    lualine_y = { encoding, fileformat, filetype, end_block },
    lualine_z = {},
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {},
}
