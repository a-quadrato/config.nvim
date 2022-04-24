local fn = vim.fn
local termcodes = require("utils.init").termcodes

-- thank you: https://github.com/smauel/dotfiles/blob/master/config/nvim.bk/lua/config/coc.lua
local function check_back_space()
	local col = vim.api.nvim_win_get_cursor(0)[2]
	return (col == 0 or vim.api.nvim_get_current_line():sub(col, col):match("%s")) and true
end

function CocSmartTab()
	if fn.pumvisible() == 1 then
		return termcodes("<C-n>")
	elseif fn["coc#expandableOrJumpable"]() == 1 then
		return termcodes("<C-r>") .. [[=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])]] .. termcodes("<CR>")
	else
		local status, result = pcall(check_back_space)
		if status and result then
			return termcodes("<Tab>")
		else
			return fn["coc#refresh"]()
		end
	end
end

function CocShowDocumentation()
	if fn.index({ "vim", "help" }, vim.bo.filetype) >= 0 then
		vim.cmd("h " .. fn.expand("<cword>"))
	elseif fn["coc#rpc#ready"]() then
		fn.CocActionAsync("doHover")
	else
		vim.cmd("!" .. vim.o.keywordprg .. " " .. fn.expand("<cword>"))
	end
end

local function setup()
	vim.g.coc_global_extensions = {
		"@yaegassy/coc-ansible",
		"coc-clangd",
		"coc-css",
		"coc-docker",
		"coc-flutter",
		"coc-git",
		"coc-go",
		"coc-golines",
		"coc-highlight",
		"coc-html",
		"coc-jedi",
		"coc-json",
		"coc-stylua",
		"coc-sumneko-lua",
		"coc-markdownlint",
		"@yaegassy/coc-nginx",
		"coc-pairs",
		"coc-prettier",
		"coc-pyright",
		"coc-rls",
		"coc-rust-analyzer",
		"coc-sh",
		"coc-snippets",
		"coc-sql",
		"coc-swagger",
		"coc-syntax",
		"coc-tailwindcss",
		"coc-texlab",
		"coc-toml",
		"coc-tsserver",
		"coc-xml",
		"coc-yaml",
		"coc-yank",
	}

	-- When popup menu is visible, tab goes to next entry.
	-- Else, if the cursor is in an active snippet, tab between fields.
	-- Else, if the character before the cursor isn't whitespace, put a Tab.
	-- Else, refresh the completion list
	--inoremap('<TAB>', 'v:lua.CocSmartTab()', {silent = true, expr = true})
	vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.CocSmartTab()", { expr = true, noremap = true, silent = true })

	-- Shift-Tab for cycling backwards through matches in a completion popup
	--inoremap('<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<C-h>"', {silent = true, expr = true})
	vim.api.nvim_set_keymap(
		"i",
		"<S-Tab>",
		'pumvisible() ? "\\<C-p>" : "\\<C-h>"',
		{ expr = true, noremap = true, silent = true }
	)

	-- Enter to confirm completion
	--inoremap('<CR>', 'pumvisible() ? "\\<C-y>" : "\\<CR>"', {silent = true, expr = true})
	vim.api.nvim_set_keymap(
		"i",
		"<CR>",
		'pumvisible() ? "\\<C-y>" : "\\<CR>"',
		{ expr = true, noremap = true, silent = true }
	)

	-- Use <c-space> to trigger completion.
	--inoremap('<c-space>', 'coc#refresh()', {silent = true, expr = true})
	vim.api.nvim_set_keymap("i", "<c-space>", "coc#refresh()", { expr = true, noremap = true, silent = true })

	-- Use K to show documentation in preview window
	--nnoremap('K', 'call v:lua.CocShowDocumentation()<CR>', {silent = true})
	vim.api.nvim_set_keymap("n", "K", ":call v:lua.CocShowDocumentation()<CR>", { noremap = true, silent = true })

	-- Filetype remapping for Ansible
	vim.g["coc_filetype_map"] = '{"yaml.ansible":"ansible"}'
end

return {
	setup = setup,
}
