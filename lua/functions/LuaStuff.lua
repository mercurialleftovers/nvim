local M = {}
M.setup = function(LSP, grp)
    function RuffFormat(args)
        -- if not vim.fn.executable('luaformatter') then
        --     return
        -- end
        --
        -- local filename = vim.fn.expand('%:p')
        -- local ruff_cmd = "luaformatter -i " .. filename
        --
        -- vim.fn.system(ruff_cmd)
        -- vim.fn.execute(":e!")
        vim.lsp.buf.format({bufnr = args.buf})
    end

    vim.api.nvim_create_autocmd(
        {
            "BufWritePost",
        },
        {
            pattern={'*.lua'},
            callback=RuffFormat,
            group=grp,
        }
    )
end


return M
