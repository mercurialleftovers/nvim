
function ToggleList()
    -- vim.opt.list["_value"] = not vim.opt.list["_value"]
    vim.opt.list = not vim.opt.list:get()
end

vim.keymap.set('n', '<s-f1>', '', {callback=ToggleList, silent=true, noremap=true})
