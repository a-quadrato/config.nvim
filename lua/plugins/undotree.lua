local map = require("utils.init").map

local function config()
  print "Undotree config function called..."
  map("n", "<leader>u", ":UndotreeToggle<CR>")
  vim.g.undotree_SplitWidth = 40
end
return {
  config = config,
}
