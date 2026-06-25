-- emacs-like movements:
vim.keymap.set("n", "<c-a>", "^", kmp_config)
vim.keymap.set("v", "<c-a>", "^", kmp_config)
vim.keymap.set("i", "<c-a>", "<esc>^i", kmp_config)

vim.keymap.set("n", "<c-e>", "$", kmp_config)
vim.keymap.set("v", "<c-e>", "$", kmp_config)
vim.keymap.set("i", "<c-e>", "<esc>$a", kmp_config)

-- basic text editing:
vim.keymap.set("n", "<c-s>", ":w<CR>", kmp_config)
vim.keymap.set("v", "<c-s>", ":w<CR>", kmp_config)
vim.keymap.set("i", "<c-s>", "<esc>:w<CR>", kmp_config)

vim.keymap.set("n", "<c-c>", "yy", kmp_config)
vim.keymap.set("v", "<c-c>", "y", kmp_config)
vim.keymap.set("i", "<c-c>", "<esc>yiwea", kmp_config)

vim.keymap.set("n", "<c-v>", "p", kmp_config)
vim.keymap.set("v", "<c-v>", "p", kmp_config)
vim.keymap.set("i", "<c-v>", "<esc>pa", kmp_config)

vim.keymap.set("n", "<c-x>", "dd", kmp_config)
vim.keymap.set("v", "<c-x>", "x", kmp_config)
vim.keymap.set("i", "<c-x>", "<esc>dd", kmp_config)

-- moving locs up and down:
vim.keymap.set("n", "J", "V:m '>+1<CR>gv=gv", kmp_config)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", kmp_config)
vim.keymap.set("n", "K", "V:m '<-2<CR>gv=gv", kmp_config)
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", kmp_config)

-- launching terminal
local tlaunch = "<c-enter>"
local tnormal= "<c-\\><c-N>"

if  not vim.fn.has("gui_running") then
    tlaunch = "<c-`>"
end

vim.keymap.set("n", tlaunch, ":hor term<CR>", kmp_config)
vim.keymap.set("v", tlaunch, "<esc>:hor term<CR>gv", kmp_config)
vim.keymap.set("i", tlaunch, "<esc>:hor term<CR>a", kmp_config)
vim.keymap.set("t", tlaunch, tnormal .. ":q!<CR>", kmp_config)

-- navigation (windows and tabs)
vim.keymap.set("n", "<a-h>", ":tabprevious<enter>", kmp_config)
vim.keymap.set("n", "<a-l>", ":tabnext<enter>", kmp_config)
vim.keymap.set("i", "<a-h>", "<esc>:tabprevious<enter>", kmp_config)
vim.keymap.set("i", "<a-l>", "<esc>:tabnext<enter>", kmp_config)
vim.keymap.set("v", "<a-h>", ":tabprevious<enter>", kmp_config)
vim.keymap.set("v", "<a-l>", ":tabnext<enter>", kmp_config)
vim.keymap.set("n", "<c-PgUp>", ":tabprevious<enter>", kmp_config)
vim.keymap.set("n", "<c-PgDown>", ":tabnext<enter>", kmp_config)
vim.keymap.set("i", "<c-PgUp>", "<esc>:tabprevious<enter>", kmp_config)
vim.keymap.set("i", "<c-PgDown>", "<esc>:tabnext<enter>", kmp_config)
vim.keymap.set("v", "<c-PgUp>", ":tabprevious<enter>", kmp_config)
vim.keymap.set("v", "<c-PgDown>", ":tabnext<enter>", kmp_config)

vim.keymap.set("t", "<a-h>", "<enter>" .. tnormal .. ":tabprevious<enter>", kmp_config)
vim.keymap.set("t", "<a-l>", "<enter>" .. tnormal .. ":tabnext<enter>", kmp_config)
vim.keymap.set("t", "<c-PgDown>", "<enter>" .. tnormal .. ":tabnext<enter>", kmp_config)
vim.keymap.set("t", "<c-PgUp>", "<enter>" .. tnormal .. ":tabprevious<enter>", kmp_config)

vim.keymap.set("n", "<a-s-h>", ":tabm -1<enter>", kmp_config)
vim.keymap.set("n", "<a-s-l>", ":tabm +1<enter>", kmp_config)
vim.keymap.set("i", "<a-s-h>", "<esc>:tabm -1<enter>", kmp_config)
vim.keymap.set("i", "<a-s-l>", "<esc>:tabm +1<enter>", kmp_config)
vim.keymap.set("v", "<a-s-h>", ":tabm -1<enter>", kmp_config)
vim.keymap.set("n", "<c-s-PgUp>", ":tabm -1<enter>", kmp_config)
vim.keymap.set("v", "<a-s-l>", ":tabm +1<enter>", kmp_config)
vim.keymap.set("n", "<c-s-PgDown>", ":tabm 1<enter>", kmp_config)
vim.keymap.set("i", "<c-s-PgUp>", "<esc>:tabm -1<enter>", kmp_config)
vim.keymap.set("i", "<c-s-PgDown>", "<esc>:tabm +1<enter>", kmp_config)
vim.keymap.set("v", "<c-s-PgUp>", ":tabm -1<enter>", kmp_config)
vim.keymap.set("v", "<c-s-PgDown>", ":tabm +1<enter>", kmp_config)

-- TODO(bader): fix whatever this is:
vim.keymap.set("t", "<a-s-h>", "<enter><c-s-w>N:tabm -1<enter>", kmp_config)
vim.keymap.set("t", "<a-s-l>", "<enter><c-s-w>N:tabm +1<enter>", kmp_config)
vim.keymap.set("t", "<c-s-PgDown>", "<enter><c-w>N:tabm +1<enter>", kmp_config)
vim.keymap.set("t", "<c-s-PgUp>", "<enter><c-w>N:tabm -1<enter>", kmp_config)

-- windows
vim.keymap.set("v", "<c-h>", "<esc><c-w>h", kmp_config)
vim.keymap.set("i", "<c-h>", "<esc><c-w>h", kmp_config)
vim.keymap.set("n", "<c-h>", "<c-w>h", kmp_config)

vim.keymap.set("v", "<c-j>", "<esc><c-w>j", kmp_config)
vim.keymap.set("i", "<c-j>", "<esc><c-w>j", kmp_config)
vim.keymap.set("n", "<c-j>", "<c-w>j", kmp_config)

vim.keymap.set("v", "<c-k>", "<esc><c-w>k", kmp_config)
vim.keymap.set("i", "<c-k>", "<esc><c-w>k", kmp_config)
vim.keymap.set("n", "<c-k>", "<c-w>k", kmp_config)

vim.keymap.set("v", "<c-l>", "<esc><c-w>l", kmp_config)
vim.keymap.set("i", "<c-l>", "<esc><c-w>l", kmp_config)
vim.keymap.set("n", "<c-l>", "<c-w>l", kmp_config)

-- resizing windows
vim.keymap.set("n", "<left>", ":vertical resize +5<CR>", kmp_config)
vim.keymap.set("n", "<right>", ":vertical resize -5<CR>", kmp_config)
vim.keymap.set("n", "<up>", ":horizontal resize +5<CR>", kmp_config)
vim.keymap.set("n", "<down>", ":horizontal resize -5<CR>", kmp_config)

-- tabs
vim.keymap.set("t", "<c-h>", tnormal .. "<c-w>h", kmp_config)
vim.keymap.set("t", "<c-j>", tnormal .. "<c-w>j", kmp_config)
vim.keymap.set("t", "<c-k>", tnormal .. "<c-w>k", kmp_config)
vim.keymap.set("t", "<c-l>", tnormal .. "<c-w>l", kmp_config)
vim.keymap.set("t", "<c-t>", tnormal .. ":tabnew<CR>", kmp_config)
vim.keymap.set("t", "<esc>", tnormal .. "<CR>", kmp_config)
vim.keymap.set("n", "<c-t>", ":tabnew<CR>", kmp_config)
vim.keymap.set("i", "<c-t>", "<esc>:tabnew<CR>", kmp_config)
vim.keymap.set("v", "<c-t>", "<esc>:tabnew<CR>", kmp_config)
-- Lex
vim.keymap.set("n", "<c-b>", ":Lex 20<CR>", kmp_config)
vim.keymap.set("v", "<c-b>", "<esc>:Lex 20<CR>gv", kmp_config)
vim.keymap.set("i", "<c-b>", "<esc>:Lex 20<CR>a", kmp_config)

-- ctrl q
vim.keymap.set("n", "<c-q>", ":q!<CR>", kmp_config)
vim.keymap.set("v", "<c-q>", "<esc>:q!<CR>", kmp_config)
vim.keymap.set("i", "<c-q>", "<esc>:q!<CR>", kmp_config)
vim.keymap.set("t", "<c-q>", tnormal .. ":q!<CR>", kmp_config)

-- tab
vim.keymap.set("n", "<tab>", "za", kmp_config)
vim.keymap.set("v", "<tab>", ">gv", kmp_config)
vim.keymap.set("v", "<s-tab>", "<gv", kmp_config)
