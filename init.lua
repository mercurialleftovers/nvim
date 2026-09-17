require('keymaps')
require('settings')
require('functions/RunFile')
require('functions/FindAndRunRecursively')
require('functions/RunSnippet')
require('functions/TermAutoInputMode')
require('functions/WebSearchCmd')
require('functions/StartFzf')

-- language specific settings, loaded lazily (autocmd filetype!)
require('functions/AutoCmd')
require('functions/Autocomplete')
--
-- require('functions/DefineWord') -- TODO(bader): find a more suitable snippet management system, or complete this one
-- require('functions/CommentLine')
require('config.lazy')




function godir()
    vim.cmd("tcd " .. MYVIMDIR)
end

-- todo:
-- - [ ] make the runFile function aware of the terminal it spawns, so that if you re-f5, it uses the same terminal buffer
-- - [ ] make formatters and runFile asynchronous
--
--
--
--

function RunFile(filename)
    print("running " .. filename)
end

TEMPDIR = vim.fs.joinpath(vim.fn.stdpath("config"), "temp")
function RunSelection()
    local outFile = vim.fs.joinpath(TEMPDIR, "temp_file_to_be_run." .. vim.o.filetype)
    vim.cmd(":'<,'>w! " .. outFile)
    vim.cmd(":vsp " .. outFile)
    RunFile(outFile)
    vim.fn.delete(outFile)
end

vim.keymap.set("v", "<S-Enter>", RunSelection, {})
