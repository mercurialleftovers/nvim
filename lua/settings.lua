-- GLOBALS:
MYVIMDIR = "C:/Users/ccc/AppData/Local/nvim"
TMPDIR = MYVIMDIR .. '/temp'
CONFIG = MYVIMDIR .. "/configs"
TERMSIZE = 20

if not vim.fn.isdirectory(TMPDIR) then
    vim.fn.mkdir(TMPDIR, 'p')
end

-- vim.cmd("cd " .. MYVIMDIR)
FNAME = "filenameholder"

interpreters = {}

if vim.fn.executable('ipython') then
    interpreters["python"] = "ipython -i " .. FNAME
else
    interpreters["python"] = "python -i " .. FNAME
end

interpreters["python"] = "python -i " .. FNAME
interpreters["lua"] = "nvim -u " .. FNAME
interpreters["javascript"] = "js " .. FNAME
interpreters["typescript"] = "deno " .. FNAME
interpreters["dosbatch"] = FNAME
interpreters["powershell"] = "powershell " .. FNAME
interpreters["c"] = "build.bat"
interpreters["cpp"] = "build.bat"

if vim.fn.has("gui_running") then
    vim.opt.guifont = { "Lucida Console", ":h11" }
end

local kmp_config = { noremap = true, silent = true }

vim.cmd.colorscheme('slate')

vim.opt.autoread = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.smarttab = true -- help smarttab
vim.opt.listchars = "eol:;,tab:>-,trail:-,extends:>,precedes:<"
-- vim.opt.list = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showcmd = false
vim.opt.showmode = false
vim.opt.cursorline = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false

-- vim.opt.undodir = "C:\\Users\\ccc\\AppData\\nvim_data\\"
vim.opt.undodir = "C:/Users/ccc/AppData/nvim_data"
vim.opt.undofile = true
vim.opt.clipboard = "unnamed"
vim.opt.scrolloff = 10
vim.opt.signcolumn = "yes:1"

vim.opt.hlsearch = true
vim.opt.incsearch = true

-- vim.opt.ignorecase = true
vim.opt.smartcase =true

vim.opt.termguicolors = true
