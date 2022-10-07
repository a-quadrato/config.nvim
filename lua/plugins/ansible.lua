-------------------------------------------------------------------------------
-- ansible-vim configuration
-----------------------------------------------------------------------------
local function setup()
  -- Match nothing so that we set ansibleft with lua-filetype builtin
  -- filetype matching.
  vim.g.ansible_ftdetect_filename_regex = "$^"
  vim.g.ansible_unindent_after_newline = 1
  vim.g.ansible_extra_keywords_highlight = 1
end

return {
  setup = setup,
}
