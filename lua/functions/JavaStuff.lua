require("functions/FindAndRunRecursively")

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

    vim.opt_local.tabstop = 2      -- Number of spaces that a <Tab> in the file counts for
    vim.opt_local.shiftwidth = 2   -- Number of spaces to use for each step of (auto)indent
    vim.opt_local.softtabstop = 2  -- Number of spaces that a <Tab> counts for while performing editing operations
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false

end

return M



-- todo:
-- - [ ] recursiveley backing down to find the closes build.bat
-- - [ ] only affect the buffer that is going to run the built.bat
