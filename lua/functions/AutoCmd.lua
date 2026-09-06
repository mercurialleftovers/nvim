LSP = true
BUILTIN = false

local mappings = {
    PythonStuff = "python",
    CStuff = { "c", "cpp" },
    LuaStuff = "lua",
    GoStuff = "go",
    MdStuff = "md",
    JavaStuff =
    "java",
    HtmlStuff = "html"
}

for filename, pattern in pairs(mappings) do
    local _grp = vim.api.nvim_create_augroup(filename, { clear = true })

    vim.api.nvim_create_autocmd(
        { "FileType" },
        {
            pattern = pattern,
            group = _grp,
            callback = function()
                local M = require("functions/" .. filename)
                if M.done then
                    return
                end
                M.setup(LSP, _grp)
                M.done = true
            end
        }
    )
end

-- format on save on LspAttach


