-- require('keymaps.lua')
vim.cmd("cd C:\\Users\\ccc\\AppData\\Local\\nvim")
if vim.fn.has("gui_running") then
    -- vim.opt.guifont = { "IBM Plex Mono", ":h11" }
    vim.opt.guifont = { "Lucida Console", ":h11" }
end

vim.cmd.colorscheme('slate')

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.smarttab = true -- help smarttab
vim.opt.listchars = "eol:;,tab:>-,trail:-,extends:>,precedes:<"
vim.opt.list = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showcmd = false
vim.opt.showmode = false
vim.opt.cursorline = true
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.swapfile = false
vim.opt.backup = false
-- vim.opt.undodir = os.getenv("HOME") -- get %appdata%/undodir
vim.opt.undofile = true
vim.opt.clipboard = "unnamed"
vim.opt.scrolloff = 10
vim.opt.signcolumn = "yes:1"

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase =true

vim.opt.termguicolors = true

-- emacs-like movements:
vim.keymap.set("n", "<c-a>", "^")
vim.keymap.set("v", "<c-a>", "^")
vim.keymap.set("i", "<c-a>", "<esc>^i")

vim.keymap.set("n", "<c-e>", "$")
vim.keymap.set("v", "<c-e>", "$")
vim.keymap.set("i", "<c-e>", "<esc>$a")

-- basic text editing:
vim.keymap.set("n", "<c-s>", ":w<CR>")
vim.keymap.set("v", "<c-s>", ":w<CR>")
vim.keymap.set("i", "<c-s>", "<esc>:w<CR>")

vim.keymap.set("n", "<c-c>", "yy")
vim.keymap.set("v", "<c-c>", "y")
vim.keymap.set("i", "<c-c>", "<esc>yiwea")

vim.keymap.set("n", "<c-v>", "p")
vim.keymap.set("v", "<c-v>", "p")
vim.keymap.set("i", "<c-v>", "<esc>pa")

vim.keymap.set("n", "<c-x>", "dd")
vim.keymap.set("v", "<c-x>", "x")
vim.keymap.set("i", "<c-x>", "<esc>dd")

-- moving locs up and down:
vim.keymap.set("n", "J", "V:m '>+1<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("n", "K", "V:m '<-2<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- term stuff
local tlaunch = "<c-enter>"
local tnormal= "<c-\\><c-N>"

if not vim.fn.has("gui_running") then
    term_launch_key = "<c-`>"
end

vim.keymap.set("n", tlaunch, ":term<CR>")
vim.keymap.set("v", tlaunch, "<esc>:term<CR>gv")
vim.keymap.set("i", tlaunch, "<esc>:term<CR>a")
vim.keymap.set("t", tlaunch, tnormal .. ":q!<CR>")

-- navigation (windows and tabs)
vim.keymap.set("n", "<silent> <a-h>", ":tabprevious<enter>")
vim.keymap.set("n", "<silent> <a-l>", ":tabnext<enter>")
vim.keymap.set("i", "<silent> <a-h>", "<esc>:tabprevious<enter>")
vim.keymap.set("i", "<silent> <a-l>", "<esc>:tabnext<enter>")
vim.keymap.set("v", "<silent> <a-h>", ":tabprevious<enter>")
vim.keymap.set("v", "<silent> <a-l>", ":tabnext<enter>")
vim.keymap.set("n", "<silent> <c-PgUp>", ":tabprevious<enter>")
vim.keymap.set("n", "<silent> <c-PgDown>", ":tabnext<enter>")
vim.keymap.set("i", "<silent> <c-PgUp>", "<esc>:tabprevious<enter>")
vim.keymap.set("i", "<silent> <c-PgDown>", "<esc>:tabnext<enter>")
vim.keymap.set("v", "<silent> <c-PgUp>", ":tabprevious<enter>")
vim.keymap.set("v", "<silent> <c-PgDown>", ":tabnext<enter>")

vim.keymap.set("t", "<silent> <a-h>", "<enter><c-w>N:tabprevious<enter>")
vim.keymap.set("t", "<silent> <a-l>", "<enter><c-w>N:tabnext<enter>")
vim.keymap.set("t", "<silent> <c-PgDown>", "<enter><c-w>N:tabnext<enter>")
vim.keymap.set("t", "<silent> <c-PgUp>", "<enter><c-w>N:tabprevious<enter>")


vim.keymap.set("n", "<silent> <a-s-h>", ":tabm -1<enter>")
vim.keymap.set("n", "<silent> <a-s-l>", ":tabm +1<enter>")
vim.keymap.set("i", "<silent> <a-s-h>", "<esc>:tabm -1<enter>")
vim.keymap.set("i", "<silent> <a-s-l>", "<esc>:tabm +1<enter>")
vim.keymap.set("v", "<silent> <a-s-h>", ":tabm -1<enter>")
vim.keymap.set("n", "<silent> <c-s-PgUp>", ":tabm -1<enter>")
vim.keymap.set("v", "<silent> <a-s-l>", ":tabm +1<enter>")
vim.keymap.set("n", "<silent> <c-s-PgDown>", ":tabm 1<enter>")
vim.keymap.set("i", "<silent> <c-s-PgUp>", "<esc>:tabm -1<enter>")
vim.keymap.set("i", "<silent> <c-s-PgDown>", "<esc>:tabm +1<enter>")
vim.keymap.set("v", "<silent> <c-s-PgUp>", ":tabm -1<enter>")
vim.keymap.set("v", "<silent> <c-s-PgDown>", ":tabm +1<enter>")

vim.keymap.set("t", "<silent> <a-s-h>", "<enter><c-s-w>N:tabm -1<enter>")
vim.keymap.set("t", "<silent> <a-s-l>", "<enter><c-s-w>N:tabm +1<enter>")
vim.keymap.set("t", "<silent> <c-s-PgDown>", "<enter><c-w>N:tabm +1<enter>")
vim.keymap.set("t", "<silent> <c-s-PgUp>", "<enter><c-w>N:tabm -1<enter>")

-- windows
vim.keymap.set("v", "<c-h>", "<esc><c-w>h")
vim.keymap.set("i", "<c-h>", "<esc><c-w>h")
vim.keymap.set("n", "<c-h>", "<c-w>h")

vim.keymap.set("v", "<c-j>", "<esc><c-w>j")
vim.keymap.set("i", "<c-j>", "<esc><c-w>j")
vim.keymap.set("n", "<c-j>", "<c-w>j")

vim.keymap.set("v", "<c-k>", "<esc><c-w>k")
vim.keymap.set("i", "<c-k>", "<esc><c-w>k")
vim.keymap.set("n", "<c-k>", "<c-w>k")

vim.keymap.set("v", "<c-l>", "<esc><c-w>l")
vim.keymap.set("i", "<c-l>", "<esc><c-w>l")
vim.keymap.set("n", "<c-l>", "<c-w>l")
-- resizing windows
vim.keymap.set("n", "<left>", ":vertical resize +5<CR>")
vim.keymap.set("n", "<right>", ":vertical resize -5<CR>")
vim.keymap.set("n", "<up>", ":horizontal resize +5<CR>")
vim.keymap.set("n", "<down>", ":horizontal resize -5<CR>")

-- tabs
vim.keymap.set("t", "<c-h>", tnormal .. "<c-w>h")
vim.keymap.set("t", "<c-h>", tnormal .. "<c-w>j")
vim.keymap.set("t", "<c-h>", tnormal .. "<c-w>k")
vim.keymap.set("t", "<c-h>", tnormal .. "<c-w>l")
vim.keymap.set("t", "<c-t>", tnormal .. ":tabnew<CR>")
vim.keymap.set("t", "<esc>", tnormal .. "<CR>")
vim.keymap.set("n", "<c-t>", ":tabnew<CR>")
vim.keymap.set("i", "<c-t>", "<esc>:tabnew<CR>")
vim.keymap.set("v", "<c-t>", "<esc>:tabnew<CR>")
-- Lex
vim.keymap.set("n", "<c-b>", ":Lex 30<CR>")
vim.keymap.set("v", "<c-b>", "<esc>:Lex 30<CR>gv")
vim.keymap.set("i", "<c-b>", "<esc>:Lex 30<CR>a")

-- ctrl q
vim.keymap.set("n", "<c-q>", ":q!<CR>")
vim.keymap.set("v", "<c-q>", "<esc>:q!<CR>")
vim.keymap.set("i", "<c-q>", "<esc>:q!<CR>")
vim.keymap.set("t", "<c-q>", "<esc>:q!<CR>")

-- tab
vim.keymap.set("n", "<tab>", "za")
vim.keymap.set("v", "<tab>", ">gv")
vim.keymap.set("v", "<s-tab>", "<gv")
