LSP = true

if LSP then
    vim.diagnostic.config({ virtual_text = true })
    -- vim.lsp.completion.enable(true, "jdtls", 0, {commit_characters = false})
    -- [[
    --autotrigger: Set to true to make the completion menu pop up automatically on server-defined trigger characters. Set to false to trigger manually (e.g., via Ctrl + Space or built-in keymaps).
    -- ]]
    -- this upcoming section is heavily AI-influenced:
    -- Tab to go down the menu
    vim.keymap.set('i', '<Tab>', function()
      return vim.fn.pumvisible() ~= 0 and '<C-n>' or '<Tab>'
    end, { expr = true })

    -- Shift+Tab to go up the menu
    vim.keymap.set('i', '<S-Tab>', function()
      return vim.fn.pumvisible() ~= 0 and '<C-p>' or '<S-Tab>'
    end, { expr = true })
    vim.opt.completeopt = { "menuone", "noselect", "noinsert" }
    vim.api.nvim_create_autocmd('LspAttach', {
      callback = function(args)
        vim.lsp.completion.enable(true, args.data.client_id, args.buf, {
          autotrigger = true, commit_characters = false
        })
  end,
})
end


local mappings = {PythonStuff="python", CStuff={"c", "cpp"}, LuaStuff="lua", GoStuff="go", MdStuff="md", JavaStuff="java"}

for filename, pattern in pairs(mappings) do
    local _grp = vim.api.nvim_create_augroup(filename, {clear=true})

    vim.api.nvim_create_autocmd(
        {"FileType"},
        {
            pattern=pattern,
            group=_grp,
            callback=function()
                local M = require("functions/" .. filename)
                if M.done then
                    return
                end
                M.setup(LSP, _grp)
                M.done = true
            end
        }
    )
end
