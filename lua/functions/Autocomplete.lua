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


-- c-space to trigger omnifunc
vim.keymap.set("i", "<C-space>", "<C-x><C-o>", {silent=true})
--
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("LspAttachGroup", {}),
    callback = function(ev)
        -- vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
        local opts = {buffer = ev.buf}

        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<leader>i", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>D", vim.diagnostic.open_float, opts)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

    end
})
