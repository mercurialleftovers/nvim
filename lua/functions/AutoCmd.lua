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

local go_grp = vim.api.nvim_create_augroup("lua_augroup", {clear=true})
vim.api.nvim_create_autocmd(
    {"FileType"},
    {
        pattern={"go"},
        group=go_grp,
        callback=function() require("functions/GoStuff") end
    }
)

local java_grp = vim.api.nvim_create_augroup("lua_augroup", {clear=true})
vim.api.nvim_create_autocmd(
    {"FileType"},
    {
        pattern={"java"},
        group=java_grp,
        callback=function() require("functions/JavaStuff") end
    }
)
