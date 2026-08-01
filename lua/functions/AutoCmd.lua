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

local python_grp = vim.api.nvim_create_augroup("python_augroup", {clear=true})
vim.api.nvim_create_autocmd(
    {"FileType"},
    {
        pattern="python",
        group=python_grp,
        callback=function()
            print("adding the autocmd: PythonStuff")
            local M = require("functions/PythonStuff")
            if M.done then
                return
            end
            M.setup(LSP, python_grp)
            M.done = true
        end
    }
)

local c_grp = vim.api.nvim_create_augroup("c_augroup", {clear=true})
vim.api.nvim_create_autocmd(
    {"FileType"},
    {
        pattern={"c", "cpp"},
        group=c_grp,
        callback=function()
            local M = require("functions/CStuff")
            if M.done then
                return
            end
            M.setup(LSP, c_grp)
            M.done = true
        end
    }
)


local go_grp = vim.api.nvim_create_augroup("go_augroup", {clear=true})
vim.api.nvim_create_autocmd(
    {"FileType"},
    {
        pattern={"go"},
        group=go_grp,
        callback=function()
            local M = require("functions/GoStuff")
            if M.done then
                return
            end
            M.setup(LSP, go_grp)
            M.done = true
        end
    }
)


local lua_grp = vim.api.nvim_create_augroup("lua_augroup", {clear=true})
vim.api.nvim_create_autocmd(
    {"FileType"},
    {
        pattern={"lua"},
        group=lua_grp,
        callback=function()
            local M = require("functions/LuaStuff")
            if M.done then
                return
            end
            M.setup(LSP, lua_grp)
            M.done = true
        end
    }
)

local java_grp = vim.api.nvim_create_augroup("java_augroup", {clear=true})
vim.api.nvim_create_autocmd(
    {"FileType"},
    {
        pattern={"java"},
        group=java_grp,
        callback=function()
            local M = require("functions/JavaStuff")
            if M.done then
                return
            end
            M.setup(LSP, java_grp)
            M.done = true
        end
    }
)


local md_grp = vim.api.nvim_create_augroup("md_augroup", {clear=true})
vim.api.nvim_create_autocmd(
    {"FileType"},
    {
        pattern={"markdown"},
        group=md_grp,
        callback=function()
            local M = require("functions/MdStuff")
            if M.done then
                return
            end
            M.setup(LSP, md_grp)
            M.done = true
        end
    }
)
