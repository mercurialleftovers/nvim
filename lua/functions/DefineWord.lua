function DefineWord()
    vim.fn.execute("normal \"cyiw")
    local word = vim.fn.getreg('c')


    local base_folder = SNIPPETS .. '/' .. vim.o.filetype
    local main_file = base_folder  .. ".json"
    local main_folder = base_folder .. vim.o.filetype
    local dict = vim.fn.json_decode(vim.fn.readfile(main_file))

    vim.fn.setreg('c', dict[vim.fn.getreg('c')])
    vim.fn.execute("normal viw\"cp")
end



vim.keymap.set('i', '<c-space>', '', { callback=DefineWord, noremap=true, silent=true })
vim.keymap.set('n', '<c-space>', '', { callback=DefineWord, noremap=true, silent=true })
vim.keymap.set('v', '<c-space>', '', { callback=DefineWord, noremap=true, silent=true })
