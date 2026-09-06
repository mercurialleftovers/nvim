local M = {}

M.setup = function(LSP, grp)
    -- function RuffFormatLegacy(id, event, group, file, match, buff, data)
    --     if not vim.fn.executable('gofmt') then
    --         return
    --     end
    --
    --     local filename = vim.fn.expand('%:p')
    --     local ruff_cmd = "gofmt -w " .. filename
    --
    --     vim.fn.system(ruff_cmd)
    --     vim.fn.execute(":e!")
    -- end

    -- vim.api.nvim_create_autocmd(
    --     {
    --         "BufWritePost",
    --     },
    --     {
    --         pattern = { '*.go' },
    --         callback = RuffFormatLegacy,
    --         group = grp,
    --     }
    -- )
end

return M
