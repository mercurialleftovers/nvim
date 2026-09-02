vim.opt.autocomplete = true
vim.opt.complete = {"i", ".", "b", "w", "kspell"}
vim.opt.completeopt = {"menu", "menuone", "noinsert", "noselect", "fuzzy"}


vim.keymap.set(
    "i",
    "<Tab>",
    function()
        if vim.fn.pumvisible() == 1 then
            return "<c-n>"
        else
            return "<Tab>"
        end
    end,
    {expr = true, silent=true}
)

vim.keymap.set(
    "i",
    "<S-Tab>",
    function()
        if vim.fn.pumvisible() == 1 then
            return "<c-p>"
        else
            return "<S-Tab>"
        end
    end,
    {expr = true, silent=true}
)
