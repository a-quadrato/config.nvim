local core = require("utils.core")

function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local function get_git_info(force)
	if force or not git_branch or git_branch == "" then
		git_branch = vim.fn["fugitive#head"]()
		if not git_branch or git_branch == "" then
			git_branch = ""
		end
		if #git_branch > 14 then
			git_branch = git_branch:sub(1, 11) .. "..."
		end
	end
	return git_branch
end

-- get vim cwd
local function get_cwd()
	return vim.fn.getcwd()
end

-- strip trailing whitespaces in file
local function strip_trailing_whitespaces()
	local cursor = vim.api.nvim_win_get_cursor(0)
	vim.api.nvim_command("%s/\\s\\+$//e")
	vim.api.nvim_win_set_cursor(0, cursor)
end

-- gCocCommand document.renameCurrentWrod<CR>et git repo root dir (or nil)
local function get_git_root()
	local git_cmd = "git -C " .. get_cwd() .. " rev-parse --show-toplevel"
	local root, rc = core.lua_systemlist(git_cmd)

	if rc == 0 then
		return root[1]
	end
	return nil
end

local function show_docs()
	local ft = vim.bo.filetype
	local cmd_index = vim.cmd("index(['vim','help']," .. ft .. ")")
	if cmd_index.length >= 0 then
		print("cool")
	else
		print("Coc word")
	end
end

local function enable_spelling()
	local ft = vim.bo.filetype
	local spellable = { "markdown", "gitcommit", "txt", "liquid", "rst", "text" }
	if core.contains(spellable, ft) then
		vim.opt.spell = true
	else
		vim.opt.spell = false
	end
end

local function termcodes(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end

return {
	get_cwd = get_cwd,
	get_git_info = get_git_info,
	get_git_root = get_git_root,
	strip_trailing_whitespaces = strip_trailing_whitespaces,
	show_docs = show_docs,
	map = map,
	enable_spelling = enable_spelling,
	termcodes = termcodes,
}
