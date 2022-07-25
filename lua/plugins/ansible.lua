-------------------------------------------------------------------------------
-- ansible-vim configuration
-----------------------------------------------------------------------------
local au = vim.api.nvim_create_autocmd
-- local utils = require "utils.init"

local function setup()
  -- enable Spelling for text files
  -- Sadly does not work. 😢
  au("FileType", {
    group = "Misc",
    pattern = "yaml.ansible",
    callback = function()
      vim.cmd [[TSDisable highlight]]
      -- this has to happen before CoC is loaded, otherwise this shit won't work...
      vim.g.coc_filetype_map = "{'yaml.ansible':'ansible'}"
      -- vim.cmd([[CocRestart]])
    end,
  })
  vim.g.ansible_ftdetect_filename_regex = "$^" -- match nothing so that we set ansibleft with filetype.nvim
end

return {
  setup = setup,
}
