local items = {}

items['('] = '()'
items['{'] = '{}'
items['"'] = '""'
items['`'] = '``'
items["'"] = "''"

local Left = 

for letter, expr in pairs(items) do
    -- vim.keymap.set('i', letter, expr, {noremap=true, callback=function() vim.fn.execute("normal <left>") end})
    vim.keymap.set('i', letter, expr, {noremap=true, callback=function() end})
end

