local M = {}
M.setup = function(LSP, grp)
    function Formatter(id, event, group, file, match, buff, data)
        if not vim.fn.executable('prettier') then
            return
        end

        local filename = vim.fn.expand('%:p')
        local formatter_cmd = "prettier --write " .. filename

        vim.fn.system(formatter_cmd)
        vim.fn.execute(":e!")
    end

    vim.api.nvim_create_autocmd(
        {
            "BufWritePost",
        },
        {
            pattern={'*.md'},
            callback=Formatter,
            group=grp,
        }
    )

    -- if LSP then
    --     vim.lsp.enable("gopls")
    -- end
end

return M
