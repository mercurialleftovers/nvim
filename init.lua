require('keymaps')
require('settings')
require('functions/RunFile')
require('functions/RunSnippet')
require('functions/TermAutoInputMode')
require('functions/WebSearchCmd')
require('functions/StartFzf')
require('functions/AutoCmd')
-- require('functions/DefineWord')
-- require('functions/CommentLine')
require('config.lazy')


if LSP then
    print('LSP activated!')
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



function godir()
    vim.cmd("cd " .. MYVIMDIR) 
end


-- testing:
local testing = false
if testing then
    local text = [[hello, world!]]
    local word = string.sub(text, text:find("hello"))
    print(word)
end
