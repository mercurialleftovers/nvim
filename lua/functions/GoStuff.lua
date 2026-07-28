
local cache_dir = vim.fn.expand("~/.ruff_cache")

function RuffFormat(id, event, group, file, match, buff, data)
    if not vim.fn.executable('gofmt') then
        return
    end

    local filename = vim.fn.expand('%:p')
    local ruff_cmd = "gofmt -w " .. filename

    vim.fn.system(ruff_cmd)
    vim.fn.execute(":e!")
end

local go_autoformat_group = vim.api.nvim_create_augroup(
    "python_format_on_save", 
    {
        clear=true
    }
)

vim.api.nvim_create_autocmd(
    {
        "BufWritePost",
    },
    {
        pattern={'*.go'},
        callback=RuffFormat,
        group=go_autoformat_group,
    }
)
