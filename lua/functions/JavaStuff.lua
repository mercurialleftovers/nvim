function JavaFormat(id, event, group, file, match, buff, data)
    if not vim.fn.executable('astyle') then
        return
    end

    local filename = vim.fn.expand('%:p')
    local astyle_cmd = "astyle --suffix=none --squeeze-ws --style=java " .. filename

    vim.fn.system(astyle_cmd)
    vim.fn.execute(":e!")
end

local java_autoformat_group = vim.api.nvim_create_augroup(
    "java_format_on_save", 
    {
        clear=true
    }
)

vim.api.nvim_create_autocmd(
    {
        "BufWritePost",
    },
    {
        pattern={'*.java'},
        callback=JavaFormat,
        group=java_autoformat_group,
    }
)


if LSP then
    vim.lsp.enable("jdtls")
end
