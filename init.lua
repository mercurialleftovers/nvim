require('keymaps')
require('settings')
require('functions/RunFile')
require('functions/RunSnippet')
require('functions/TermAutoInputMode')
require('functions/WebSearchCmd')
require('functions/StartFzf')
-- require('functions/DefineWord')
-- require('functions/CommentLine')
-- plugins
require('config.lazy')

if LSP then
    vim.diagnostic.config({ virtual_text = true })
end


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


local go_grp = vim.api.nvim_create_augroup("go_augroup", {clear=true})
vim.api.nvim_create_autocmd(
    {"FileType"},
    {
        pattern={"go"},
        group=go_grp,
        callback=function() require("functions/GoStuff") end
    }
)


local lua_grp = vim.api.nvim_create_augroup("lua_augroup", {clear=true})
vim.api.nvim_create_autocmd(
    {"FileType"},
    {
        pattern={"lua"},
        group=lua_grp,
        callback=function() require("functions/LuaStuff") end
    }
)

function godir()
    vim.cmd("cd " .. MYVIMDIR) 
end


-- testing:
local testing = false
if testing then
    local text = [[hello, world!]]
    local word = string.sub(text, text:find("hello"))
    print(word)
end
