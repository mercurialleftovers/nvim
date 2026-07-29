function RuffFormat(id, event, group, file, match, buff, data)
    if not vim.fn.executable('luaformatter') then
        return
    end

    local filename = vim.fn.expand('%:p')
    local ruff_cmd = "luaformatter -i " .. filename

    vim.fn.system(ruff_cmd)
    vim.fn.execute(":e!")
end

local lua_autoformat_group = vim.api.nvim_create_augroup(
    "lua_format_on_save", 
    {
        clear=true
    }
)

vim.api.nvim_create_autocmd(
    {
        "BufWritePost",
    },
    {
        pattern={'*.lua'},
        callback=RuffFormat,
        group=lua_autoformat_group,
    }
)

if LSP then
    vim.lsp.enable('emmylua_ls')
end
