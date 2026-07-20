require('keymaps')
require('settings')
require('functions/RunFile')
require('functions/RunSnippet')
require('functions/TermAutoInputMode')
require('functions/WebSearchCmd')
require('functions/StartFzf')
-- require('functions/DefineWord')
-- require('functions/CommentLine')

local python_grp = vim.api.nvim_create_augroup("python_augroup", {clear=true})
vim.api.nvim_create_autocmd(
    {"FileType"},
    {
        pattern="python",
        group=python_grp,
        callback=function() require("functions/PythonStuff") end
    }
)

local c_grp = vim.api.nvim_create_augroup("c_augroup", {clear=true})
vim.api.nvim_create_autocmd(
    {"FileType"},
    {
        pattern={"c", "cpp"},
        group=c_grp,
        callback=function() require("functions/CStuff") end
    }
)
