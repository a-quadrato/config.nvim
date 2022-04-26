-- Functional wrapper for pamming custom keybindings

local map = require("utils.init").map

-- General Key mappings should be done in here. Plugin specific ones
-- in each plugin.lua file respectively.

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

-- Usefull stuff
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

-- Sweet Sweet FuGITive
map("n", "<leader>gh", ":diffget //3<CR>")
map("n", "<leader>gu", ":diffget //2<CR>")
map("n", "<leader>gs", ":G<CR>")

-- Spell-check set to <leader>o, 'o' for 'orthography' -- TODO: replace with treesitter spellcheck??
map("n", "<leader>o", ":setlocal spell! spelllang=en_us<CR>")
map("n", "<leader>z", "1z=<CR>")

-- Stop highlighting
map("n", "<esc><esc>", ":noh<CR><esc>", { silent = true })

map("n", "<leader><CR>", ":so ~/.config/nvim/init.lua<CR>")
map("n", "<leader>q", ":bd<CR>")
map("n", "<leader>w", ":w<CR>")
map("n", "<leader>rn", "<Plug>")

-- Tab movement
map("n", "<Tab>", ":bnext<CR>")
map("n", "<S-Tab>", ":bprevious<CR>")

-- Quick newlines
map("", "<S-Enter>", "o<ESC>")
map("", "<Enter>", "O<ESC>")
map("n", "<leader>u", ":UndotreeShow<CR>")
