local fn = vim.fn
local map = require("utils.init").map

local function config()
	-- body-- search keymaps, commands, and autocmds
	map("n", "<F1>", ":Legendary")
	-- search keymaps
	map("n", "<F5>", ":Legendary keymaps")
	-- search commands
	map("n", "<F6>", ":Legendary commands")
	-- search autocmds
	map("n", "<F6>", ":Legendary autocmds")
end

return {
	config = config,
}
