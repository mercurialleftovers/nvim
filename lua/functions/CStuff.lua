local M = {}
M.setup = function(LSP, grp)
    function ClangFormat()
        if not vim.fn.executable('clang-format') then
            return
        end

        local config_file_path = CONFIG .. '/' .. '.clang-format'
        local filename = vim.fn.expand('%:p')
        local clang_format_cmd = "clang-format -i " .. filename .. " --style=file:" .. config_file_path

        vim.fn.system(clang_format_cmd)
        vim.fn.execute(":e!")
    end


    vim.api.nvim_create_autocmd(
        {
            "BufWritePost",
        },
        {
            pattern={"*.c", "*.cc", "*.cpp", "*.h"},
            callback=ClangFormat,
            group=grp,
        }
    )

    if LSP then
        vim.lsp.enable("clangd")
        vim.lsp.enable("clangd-format")
    end


    vim.opt.tabstop = 1      -- Number of spaces that a <Tab> in the file counts for
    vim.opt.shiftwidth = 1   -- Number of spaces to use for each step of (auto)indent
    vim.opt.softtabstop = 1  -- Number of spaces that a <Tab> counts for while performing editing operations
    vim.opt.number = false
    vim.opt.relativenumber = false
    -- set.expandtab = true -- Convert tabs to spaces
    --
    --
    --
    -- create a command to attach <f5> to a certain terminal, so that it can work as a toggle ?

end

return M





function RunTogglesTerminal()
    -- print terminal buffers:
    local bufs = vim.api.nvim_list_bufs()
    for k, v in ipairs(vim.bo[21]) do
        print(k, v)
    end

end
vim.api.nvim_create_user_command(
    "MapRun", -- Map run to terminal
    RunTogglesTerminal,
    {
        nargs='*',
        desc = "maps <f5> to a certain terminal",
        force = true,
    }
)
