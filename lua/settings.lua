-- GLOBALS:
-- MYVIMDIR = "C:/Users/ccc/AppData/Local/nvim"
MYVIMDIR = string.gsub(vim.fn.stdpath("config"), [[\]], [[/]])
TMPDIR = vim.fs.joinpath(MYVIMDIR, '/temp')
CONFIG = vim.fs.joinpath(MYVIMDIR, "/configs")
SNIPPETS = vim.fs.joinpath(MYVIMDIR, "/snippets")
TERMSIZE = 20

if not vim.fn.isdirectory(TMPDIR) then
    vim.fn.mkdir(TMPDIR, 'p')
end

-- vim.cmd("cd " .. MYVIMDIR)
FNAME = "filenameholder"

interpreters = {}

-- if vim.fn.executable('ipython') then
--     interpreters["python"] = "ipython -i " .. FNAME
-- else
--     interpreters["python"] = "python -i " .. FNAME
-- end

interpreters["python"] = "python -i " .. FNAME
interpreters["lua"] = "lua " .. FNAME
interpreters["javascript"] = "js " .. FNAME
interpreters["typescript"] = "deno " .. FNAME
interpreters["dosbatch"] = FNAME
interpreters["powershell"] = "powershell " .. FNAME
interpreters["c"] = "build.bat"
interpreters["cpp"] = "build.bat"
interpreters["go"] = "go run " .. FNAME .. ""
interpreters["java"] = "java " .. FNAME

if vim.fn.has("gui_running") then
    vim.opt.guifont = { "Lucida Console", ":h11" }
end


vim.cmd.colorscheme('slate')

vim.o.autoread = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.smarttab = true -- help smarttab
vim.o.listchars = "eol:;,tab:>-,trail:-,extends:>,precedes:<"
-- vim.o.list = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.showcmd = false
vim.o.showmode = false
vim.o.cursorline = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.wrap = false

vim.o.swapfile = false
vim.o.backup = false

vim.o.undodir = vim.fs.joinpath(TMPDIR, "undodir")
if vim.fn.isdirectory(vim.o.undodir) == 0 then
    vim.fn.mkdir(vim.o.undodir)
end

vim.o.undofile = true
vim.o.clipboard = "unnamed"
vim.o.scrolloff = 20
vim.o.signcolumn = "yes:1"

vim.o.hlsearch = true
vim.o.incsearch = true

-- vim.o.ignorecase = true
vim.o.smartcase =true

vim.o.termguicolors = true
