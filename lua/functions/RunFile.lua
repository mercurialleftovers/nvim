function RunFile()
    -- you have access to: intepreters, FNAME, from settings.lua
    local filename = vim.fn.expand('%:p')
    local filetype = vim.opt.filetype["_value"]

    local cmd = interpreters[filetype]
    if not cmd then
        return
    end

    filename = vim.fn.substitute(filename, '\\', '\\\\\\\\', 'g')
    cmd = vim.fn.substitute(cmd, FNAME, filename, "g")
    cmd = vim.fn.substitute(cmd, '\\', '\\\\', "g")
    vim.fn.execute(":hor term " .. cmd)
end


vim.keymap.set(
    'n',
    '<f5>',
    '',
    {
        noremap=true,
        callback=RunFile,
        silent
    }
)
