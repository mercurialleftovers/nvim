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


local c_autoformat_grp = vim.api.nvim_create_augroup(
    "c_format_on_save", 
    {
        clear=true
    }
)

vim.api.nvim_create_autocmd(
    {
        "BufWritePost",
    },
    {
        pattern={"*.c", "*.cc", "*.cpp", "*.h"},
        callback=ClangFormat,
        group=c_autoformat_grp,
    }
)
