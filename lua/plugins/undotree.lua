local map = require("utils.init").map

local function config()
  map("n", "<leader>u", ":UndotreeToggle<CR>")
  vim.g.undotree_SplitWidth = 40
  vim.g.undotree_SetFocusWhenToggle = 1
end
return {
  config = config,
}
