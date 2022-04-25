-------------------------------------------------------------------------------
-- ansible-vim configuration
-----------------------------------------------------------------------------
local au = vim.api.nvim_create_autocmd
local utils = require("utils.init")

local function setup()
	-- enable Spelling for text files
    print("set UP ANSIBLE")
	au("FileType", {
		group = "Misc",
		pattern = "yaml",
		callback = function()
			print("Entered Ansible buffer. Disabling Treesitter highlight")
			vim.cmd([[TSBufDisable highlight]])
		end,
	})
end

return {
	setup = setup,
}
