function RunSnippet()
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "x", false) -- from gemini
    local filename = "__scratch__." .. vim.fn.expand('%:e')
    local filepath = TMPDIR .. '/' .. filename
    local cmd = interpreters[vim.o.filetype] .. " " 
    cmd = vim.fn.substitute(cmd, FNAME, filepath, "g")

    local p1 = vim.fn.getpos('v')
    local p2 = vim.fn.getpos('.')

    -- local begin_line = vim.fn.getpos('v')[2] -- used v and . instead of '< and '> as per :help getpos
    -- local end_line = vim.fn.getpos('.')[2]
    local begin_line = vim.fn.getpos('\'<')[2] -- gemini suggest using the nvim_feedkeys to escape the visual mode explicitly
    local end_line = vim.fn.getpos('\'>')[2]

    if begin_line > end_line then -- in case of selecting from bottom (from gemini)
        begin_line, end_line = end_line, begin_line
    end

    local content = vim.fn.getline(begin_line, end_line)

    vim.fn.writefile(content, filepath)
    vim.fn.execute(":hor term " .. cmd)
end

vim.keymap.set('v', '<s-enter>', RunSnippet, { noremap = true })

