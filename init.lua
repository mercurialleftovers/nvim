-- PLUGINS
require("config.lazy")
-- globals
NMODE_TERM = "<C-\\><C-n>"
FONTNAME = "Iosevka Nerd Font Mono:h11"
COLORTHEME = "slate"
INTERPRETERS = {}
INTERPRETERS["python"] = "python -i fname"
TEMPDIR = vim.fs.joinpath(vim.fn.stdpath("data"), "tempstuff")
UNDODIR = vim.fs.joinpath(TEMPDIR, "undodir")
BUILD_SCRIPT = "build.bat" -- TODO(bader): add Nix support (build.sh)
if vim.fn.isdirectory(UNDODIR) == 0 then vim.fn.mkdir(UNDODIR, "p") else print(UNDODIR .. " is a dir") end
-- settings
vim.cmd("colorscheme " .. COLORTHEME)
vim.opt.guifont = { FONTNAME }
vim.o.showmode = false
vim.o.wrap = false
vim.opt.scrolloff = 20
vim.opt.signcolumn = "yes:2"
vim.opt.statuscolumn = "%s%l |"
-- completion
vim.opt.complete = "o,.,b"
vim.opt.completeopt = "menu,menuone,fuzzy,preview,popup,noselect,noinsert"
vim.opt.autocomplete = true
-- splitting
vim.opt.splitright = true
vim.opt.splitbelow = true
-- clipboard
vim.opt.clipboard = "unnamedplus"
-- undodir
vim.opt.undodir = UNDODIR
vim.opt.swapfile = false
-- tabs
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
-- keymaps:
-- ctrl-s
vim.keymap.set({ "n", "v", "i" }, "<C-s>", "<Esc>:w<Enter>", { silent = true, noremap = true })
-- ctrl-c
vim.keymap.set({ "v" }, "<C-c>", "y", { silent = true, noremap = true })
vim.keymap.set({ "n", "i" }, "<C-c>", "<Esc>yy", { silent = true, noremap = true })
-- ctrl v
vim.keymap.set({ "v" }, "<C-v>", "p", { silent = true, noremap = true })
vim.keymap.set({ "n", "i" }, "<C-v>", "<Esc>p", { silent = true, noremap = true })
-- vim.keymap.set({ "t" }, "<C-v>", NMODE_TERM .. "p", { silent = true, noremap = true })
-- ctrl x
vim.keymap.set({ "n", "i" }, "<C-x>", "<Esc>dd", { silent = true, noremap = true })
vim.keymap.set({ "v" }, "<C-x>", "x", { silent = true, noremap = true })
-- emacs navigation
vim.keymap.set({ "i" }, "<C-a>", "<Esc>^i", { silent = true, noremap = true })
vim.keymap.set({ "i" }, "<C-e>", "<Esc>$a", { silent = true, noremap = true })
vim.keymap.set({ "v", "n" }, "<C-a>", "^", { silent = true, noremap = true })
vim.keymap.set({ "v", "n" }, "<C-e>", "$", { silent = true, noremap = true })
-- terminals
vim.keymap.set({ "i", "v", "n", "t" }, "<C-Enter>", function() vim.cmd(":hor term") end,
	{ silent = true, noremap = true })
vim.keymap.set({ "t" }, "<Esc>", NMODE_TERM, { silent = true, noremap = true })
-- ctrl-q
vim.keymap.set({ "i", "v", "n", }, "<C-q>", "<Esc>:q!<Enter>", { silent = true, noremap = true })
vim.keymap.set({ "t", }, "<C-q>", NMODE_TERM .. ":q!<Enter>", { silent = true, noremap = true })
-- tab and esc completion stuff
vim.keymap.set({ "i", }, "<Tab>", function() if vim.fn.pumvisible() == 1 then return "<C-n>" else return "<Tab>" end end,
	{ silent = true, noremap = true, expr = true })
vim.keymap.set({ "i", }, "<S-Tab>",
	function() if vim.fn.pumvisible() == 1 then return "<C-p>" else return "<S-Tab>" end end,
	{ silent = true, noremap = true, expr = true })
vim.keymap.set({ "i", }, "<Esc>", function() if vim.fn.pumvisible() == 1 then return "<C-e>" else return "<Esc>" end end,
	{ silent = true, noremap = true, expr = true })
-- tabs
vim.keymap.set({ "n", "v", "i", "t" }, "<C-t>", function() vim.cmd(":tabnew") end, { silent = true, noremap = true })
vim.keymap.set({ "n", "v", "i", "t" }, "<a-h>", function() vim.cmd(":tabprevious") end, { silent = true, noremap = true })
vim.keymap.set({ "n", "v", "i", "t" }, "<a-l>", function() vim.cmd(":tabnext") end, { silent = true, noremap = true })
vim.keymap.set({ "n", "v", "i", "t" }, "<S-a-h>", function() vim.cmd(":tabmove -1") end,
	{ silent = true, noremap = true })
vim.keymap.set({ "n", "v", "i", "t" }, "<S-a-l>", function() vim.cmd(":tabmove +1") end,
	{ silent = true, noremap = true })
-- windows
for _, val in pairs({ "h", "j", "k", "l" }) do
	vim.keymap.set({ "n", "v", "i" }, "<C-" .. val .. ">", "<Esc><C-w>" .. val, { silent = true, noremap = true })
	vim.keymap.set({ "t" }, "<C-" .. val .. ">", NMODE_TERM .. "<C-w>" .. val, { silent = true, noremap = true })
end
-- indentation
vim.keymap.set({ "v" }, "<Tab>", ">gv", { silent = true, noremap = true })
vim.keymap.set({ "v" }, "<S-Tab>", "<gv", { silent = true, noremap = true })
-- Lex
vim.keymap.set({ "n", "v", "i", "t" }, "<C-b>", function() vim.cmd(":Lex 20") end, { silent = true, noremap = true })
-- <F5>: runfile
function RunFile(filepath)
	if filepath == nil then filepath = vim.fn.substitute(vim.fn.expand("%:p"), "\\", "/", "g") end
	local cmd = INTERPRETERS[vim.o.filetype]
	if not cmd then return end
	cmd = vim.fn.substitute(cmd, "fname", filepath, "g")
	vim.cmd(":tabnew | term " .. cmd)
end

vim.keymap.set({ "n", "v", "i" }, "<F5>", RunFile, { silent = true, noremap = true })
-- <S-F5>: runfile
function RunBuildScript()
	local build_file = vim.fn.findfile(BUILD_SCRIPT, ".;", -3)
	if #build_file == 0 then return end
	build_file = build_file[1]
	local parent_dir = vim.fn.fnamemodify(build_file, ":h:p")
	vim.cmd("tcd " .. parent_dir .. " | tabnew | term " .. build_file)
end

vim.keymap.set({ "n", "v", "i" }, "<S-F5>", RunBuildScript, { silent = true, noremap = true })
-- <S-Enter>: RunChunk
function RunChunk(filepath)
	local filepath = vim.fs.joinpath(TEMPDIR, "temp_file." .. vim.o.filetype)
	vim.cmd("normal! \"cy")
	vim.fn.writefile(vim.fn.getreg('c'), filepath)
	RunFile(filepath)
end

vim.keymap.set({ "v" }, "<S-Enter>", RunChunk, { silent = true, noremap = true })
-- font increase/decrese
function ChangeFontSize(size)
	local nbr_pattern = '\\d\\+'
	local current_size = tonumber(vim.fn.matchstr(vim.o.guifont, nbr_pattern))
	if current_size == nil then return end
	vim.o.guifont = vim.fn.substitute(vim.o.guifont, nbr_pattern, current_size + size, "")
end

vim.keymap.set({ "i", "n", "v", "t" }, "<C-=>", function() ChangeFontSize(1) end, { silent = true, noremap = true })
vim.keymap.set({ "i", "n", "v", "t" }, "<C-->", function() ChangeFontSize(-1) end, { silent = true, noremap = true })
-- move selection up and down + gq if formatting capability supplied by lsp
vim.keymap.set("v", "<S-k>", ":m '<-2<CR>gv=gv", { silent = true, noremap = silent })
vim.keymap.set("v", "<S-j>", ":m '>+1<CR>gv=gv", { silent = true, noremap = silent })
-- cd into the config dir
function godir() vim.cmd("tcd " .. vim.fn.stdpath("config")) end

-- ctrl-bs
vim.keymap.set("i", "<C-BS>", "<Esc>viwxi", { silent = true, noremap = true })
