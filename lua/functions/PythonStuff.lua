local M = {}

M.setup = function(LSP, grp)
    -- local cache_dir = vim.fn.expand("~/.ruff_cache")
    local cache_dir = vim.fn.expand(TMPDIR .. "/.ruff_cache")

    function RuffFormat(id, event, group, file, match, buff, data)
        if not vim.fn.executable('ruff') then
            return
        end

        local filename = vim.fn.expand('%:p')
        local ruff_cmd = "ruff format " .. filename .. " --cache-dir " .. cache_dir

        vim.fn.system(ruff_cmd)
        vim.fn.execute(":e!")
    end


    vim.api.nvim_create_autocmd(
        {
            "BufWritePost",
        },
        {
            pattern={'*.py'},
            callback=RuffFormat,
            group=grp,
        }
    )

    if LSP then
        -- vim.lsp.enable('ruff')
        vim.lsp.enable('pyright')
    end
end

return M
