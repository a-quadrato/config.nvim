local map = require("utils.init").map
local termcodes = require("utils.init").termcodes

-- thank you: https://github.com/smauel/dotfiles/blob/master/config/nvim.bk/lua/config/coc.lua
local function check_back_space()
  local col = vim.api.nvim_win_get_cursor(0)[2]
  return (col == 0 or vim.api.nvim_get_current_line():sub(col, col):match "%s") and true
end

local function CocSmartTab()
  if vim.fn["coc#pum#visible"]() == 1 then
    return termcodes "<C-r>" .. [[=coc#pum#next(1)]] .. termcodes "<CR>"
  elseif vim.fn["coc#expandableOrJumpable"]() == 1 then
    return termcodes "<C-r>" .. [[=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])]] .. termcodes "<CR>"
  else
    local status, result = pcall(check_back_space)
    if status and result then
      return termcodes "<Tab>"
    else
      return vim.fn["coc#refresh"]()
    end
  end
end

local function CocShowDocumentation()
  if vim.fn.index({ "vim", "help" }, vim.bo.filetype) >= 0 then
    vim.cmd("h " .. vim.fn.expand "<cword>")
  elseif vim.fn["coc#rpc#ready"]() then
    vim.fn.CocActionAsync "doHover"
  else
    vim.cmd("!" .. vim.o.keywordprg .. " " .. vim.fn.expand "<cword>")
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
    "coc-ltex",
    "coc-stylua",
    "coc-sumneko-lua",
    "coc-markdownlint",
    "coc-pairs",
    "coc-prettier",
    "coc-pyright",
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
end

local function config()
  vim.g.coc_filetype_map = { ["yaml.ansible"] = "ansible", ["tex"] = "latex" }
  -- For more info see :h coc-completion and :h coc-completion-example

  -- When popup menu is visible, tab goes to next entry.
  -- Else, if the cursor is in an active snippet, tab between fields.
  -- Else, if the character before the cursor isn't whitespace, put a Tab.
  -- Else, refresh the completion list
  vim.api.nvim_set_keymap(
    "i",
    "<Tab>",
    "v:lua.require('plugins.coc').CocSmartTab()",
    { expr = true, noremap = true, silent = true }
  )

  -- Shift-Tab for cycling backwards through matches in a completion popup
  vim.api.nvim_set_keymap(
    "i",
    "<S-Tab>",
    'coc#pum#visible() ? coc#pum#prev(1): "\\<C-h>"',
    { expr = true, noremap = true, silent = true }
  )

  -- Enter to confirm completion
  --inoremap('<CR>', 'pumvisible() ? "\\<C-y>" : "\\<CR>"', {silent = true, expr = true})
  vim.api.nvim_set_keymap(
    "i",
    "<CR>",
    'coc#pum#visible() && coc#pum#info()["index"] != -1 ? coc#pum#confirm() : "\\<C-g>u\\<CR>\\<c-r>=coc#on_enter()\\<CR>"',
    { expr = true, noremap = true, silent = true }
  )

  -- Use <c-space> to trigger completion.
  --inoremap('<c-space>', 'coc#refresh()', {silent = true, expr = true})
  vim.api.nvim_set_keymap("i", "<c-space>", "coc#refresh()", { expr = true, noremap = true, silent = true })

  -- Use K to show documentation in preview window
  --nnoremap('K', 'call v:lua.CocShowDocumentation()<CR>', {silent = true})
  vim.api.nvim_set_keymap(
    "n",
    "K",
    ":call v:lua.require('plugins.coc').CocShowDocumentation()<CR>",
    { noremap = true, silent = true }
  )

  map("n", "<leader>gd", "<Plug>(coc-definition)")
  map("n", "<leader>qf", "<Plug>(coc-fix-current)")
  map("n", "<leader>a", "<Plug>(coc-codeaction-cursor)")
  map("n", "<leader>al", "<Plug>(coc-codeaction-line)")
  map("n", "<leader>la", "<Plug>(coc-codelens-action)")
  map("n", "<leader>re", "<Plug>(coc-codeaction-refactor)")
  map("x", "<leader>r", "<Plug>(coc-codeaction-refactor-selected)")
  map("n", "<leader>r", "<Plug>(coc-codeaction-refactor-selected)")
  map("n", "<leader>gy", "<Plug>(coc-type-definition)")
  map("n", "<leader>gi", "<Plug>(coc-implementation)")
  map("n", "<leader>gr", "<Plug>(coc-references)")
  map("n", "<leader>rr", "<Plug>(coc-rename)")
  map("n", "g[", "<Plug>(coc-diagnostic-prev)")
  map("n", "g]", "<Plug>(coc-diagnostic-next)")
  map("n", "<leader>gp", "<Plug>(coc-diagnostic-prev-error)", { silent = true })
  map("n", "<leader>gn", "<Plug>(coc-diagnostic-next-error)", { silent = true })
  map("n", "<leader>cr", ":CocRestart")
  map("n", "<leader>s", ":call CocAction('format')<CR>")
  map("n", "<leader>cf", ":CocFix<CR>")
  map("n", "<leader>cc", ":CocCommand<CR>")
  map("n", "<leader>cl", ":CocList<CR>")
end

return {
  setup = setup,
  config = config,
  CocSmartTab = CocSmartTab,
  CocShowDocumentation = CocShowDocumentation,
}
