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
end

return M
