-- local termWindowOpen
--

function RunFile()
    -- you have access to: intepreters, FNAME, from settings.lua
    local filename = vim.fn.expand('%:p')
    local filetype = vim.o.filetype

    local cmd = interpreters[filetype]
    if not cmd then
        return
    end

    filename = vim.fn.substitute(filename, '\\', '\\\\\\\\', 'g')
    cmd = vim.fn.substitute(cmd, FNAME, filename, "g")
    cmd = vim.fn.substitute(cmd, '\\', '\\\\', "g")

    -- if not termWindowOPen then
    -- termBuffer = vim.api.nvim_create_buffer(true, false)
    -- termBuffer.keymap.unset("<c-q>") -- disable c-q shortcut to close for the termBuffer (just the one that was spawned by runFile)
    -- termWin = vim.api.nvim_create_window() 
    -- vim.api.nvim_win_set(termWin, termBuffer, true)
    -- else
    -- vim.api.nvim_switch_to_win(termWindowOpen)
    
    vim.fn.execute(":hor term " .. cmd)
end


-- vim.keymap.set(
--     'n',
--     '<f5>',
--     '',
--     {
--         noremap=true,
--         callback=RunFile,
--         silent=true
--     }
-- )
