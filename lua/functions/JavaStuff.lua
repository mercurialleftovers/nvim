local M = {}
M.setup = function(LSP, grp)
    function JavaFormat(id, event, group, file, match, buff, data)
        if not vim.fn.executable('astyle') then
            return
        end

        local filename = vim.fn.expand('%:p')
        local astyle_cmd = "astyle --suffix=none --squeeze-ws --style=java " .. filename

        vim.fn.system(astyle_cmd)
        vim.fn.execute(":e!")
    end

    vim.api.nvim_create_autocmd(
        {
            "BufWritePost",
        },
        {
            pattern={'*.java'},
            callback=JavaFormat,
            group=grp,
        }
    )


    if LSP then
        vim.lsp.enable("jdtls")
    end
end

return M
