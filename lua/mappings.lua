-- Functional wrapper for pamming custom keybindings

local map = require("utils.init").map

-- map("n", <leader>pw :Rg <C-R>=expand("<cword>")<CR><CR>
-- map("n", <leader>phw :h <C-R>=expand("<cword>")<CR><CR>
-- Window Commands
map("n", "<leader>h", ":wincmd h<CR>")
map("n", "<leader>j", ":wincmd j<CR>")
map("n", "<leader>k", ":wincmd k<CR>")
map("n", "<leader>l", ":wincmd l<CR>")
map("n", "<leader>v", ":vsplit <CR>")
map("n", "<leader>x", ":split <CR>")
map("n", "<leader>+", ":vertical resize +5<CR>")
map("n", "<leader>-", ":vertical resize -5<CR>")
map("n", "<leader>rp", ":resize 100<CR>")

-- Usefull stuft
map("n", "<leader>u", ":UndotreeShow<CR>")
map("n", "<leader>pv", ":wincmd v<bar> :Ex <bar> :vertical resize 30<CR>")
map("n", "<Leader>ps", ":Rg<SPACE>")
map("n", "<C-p>", ":GFiles<CR>")
map("n", "<Leader>pf", ":Files<CR>")
map("n", "<Leader><CR>", ":so ~/.config/nvim/init.vim<CR>")
map("n", "<Leader>+", ":vertical resize +5<CR>")
map("n", "<Leader>-", ":vertical resize -5<CR>")
map("n", "<Leader>rp", ":resize 100<CR")
map("n", "<Leader>ee", "if err != nil {<CR>log.Fatalf('%+v\n', err)<CR>}<CR><esc>kkI<esc>")

-- TrimWhitespace
map("n", "<F2>", ":let _s=@/<Bar>:%s/\\s\\+$//e<Bar>:let @/=_s<Bar><CR>")
-- Move Selection Up/Down from https://stackoverflow.com/questions/41084565/moving-multiple-lines-in-vim-visual-mode
map("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
map("v", "K", ":m '<-2<CR>gv=gv", { silent = true })

-- Big Fat CoC
map("n", "<leader>gd", "<Plug>(coc-definition)")
map("n", "<leader>gy", "<Plug>(coc-type-definition)")
map("n", "<leader>gi", "<Plug>(coc-implementation)")
map("n", "<leader>gr", "<Plug>(coc-references)")
map("n", "<leader>rr", "<Plug>(coc-rename)")
map("n", "g[", "<Plug>(coc-diagnostic-prev)")
map("n", "g]", "<Plug>(coc-diagnostic-next)")
map("n", "<leader>gp", "<Plug>(coc-diagnostic-prev-error)", { silent = true })
map("n", "<leader>gn", "<Plug>(coc-diagnostic-next-error)", { silent = true })
map("n", "<leader>cr", ":CocRestart")

-- make CoC use tab to complete
-- map("i", "<TAB>", 'v:lua.pumvisible() ? v:lua.esc("<C-n>") : v:lua.check_back_space() ? v:lua.esc("<TAB>") : coc#refresh()', {expr = true, noremap = true, silent=true})
-- map("i", "<TAB>", 'pumvisible() ? "<C-n>" : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', {expr = true})
-- map("i","<S-TAB>","pumvisible() ? '<C-p>' : '<C-h>'", {expr = true})
-- map("i", "<CR>", 'pumvisible() ? "<c-y>" : "<CR>"', {expr = true})
-- map("n","<leader>rn", "<:Plug>(coc-rename)")
-- map("i","<TAB>","pumvisible() ? '<C-n>' : '<TAB>'", {noremap = true, silent = true, expr = true})
-- map("i", "<CR>", "pumvisible() ? coc#_select_confirm() : '<C-G>u<CR><C-R>=coc#on_enter()<CR>'", {silent = true, expr = true, noremap = true})

-- Sweet Sweet FuGITive
map("n", "<leader>gh", ":diffget //3<CR>")
map("n", "<leader>gu", ":diffget //2<CR>")
map("n", "<leader>gs", ":G<CR>")

-- Spell-check set to <leader>o, 'o' for 'orthography'
map("n", "<leader>o", ":setlocal spell! spelllang=en_us<CR>")
map("n", "<leader>z", "1z=<CR>")

-- Stop highlighting
map("n", "<esc><esc>", ":noh<CR><esc>", { silent = true })

map("n", "<leader><CR>", ":so ~/.config/nvim/init.lua<CR>")
map("n", "<leader>q", ":bd<CR>")
map("n", "<leader>w", ":w<CR>")
map("n", "<leader>s", ":call CocAction('format')<CR>")
map("n", "<leader>rn", "<Plug>")

-- Tab movement
map("n", "<Tab>", ":bnext<CR>")
map("n", "<S-Tab>", ":bprevious<CR>")

-- Quick newlines
map("", "<S-Enter>", "o<ESC>")
map("", "<Enter>", "O<ESC>")
map("n", "<leader>u", ":UndotreeShow<CR>")

-- Find them Files
map("n", "<leader>f", ":lua require'telescope.builtin'.find_files()<CR>", { silent = true })
map("n", "<leader>/", ":lua require'telescope.builtin'.live_grep()<CR>", { silent = true })
map("n", "<leader>g", ":lua require'telescope.builtin'.git_files()<CR>", { silent = true })
