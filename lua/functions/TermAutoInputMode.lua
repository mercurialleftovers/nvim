local auto_input_grp = vim.api.nvim_create_augroup(
    'terminal_auto_input',
    {
        clear=true
    }
)

vim.api.nvim_create_autocmd(
    {"TermOpen"}, 
    {
        pattern={"*"},
        callback=function()
            print('> open'); vim.cmd("resize " .. TERMSIZE)
            vim.cmd('startinsert')
        end,
        group=auto_input_grp,
    }
)

vim.api.nvim_create_autocmd(
    {"BufEnter"}, 
    {
        pattern={"term://*"},
        callback=function()
            vim.cmd('startinsert')
        end,
        group=auto_input_grp,
    }
)
