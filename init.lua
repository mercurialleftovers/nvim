require('keymaps')
require('settings')
-- require('functions/RunFile')
require('functions/RunFile')
require('functions/RunSnippet')
require('functions/TermAutoInputMode')
require('functions/WebSearchCmd')
require('functions/StartFzf')

-- language specific settings, loaded lazily (autocmd filetype!)
require('functions/AutoCmd')
-- require('functions/DefineWord')
-- require('functions/CommentLine')
require('config.lazy')




function godir()
    vim.cmd("cd " .. MYVIMDIR) 
end


-- todo:
-- - [ ] make the runFile function aware of the terminal it spawns, so that if you re-f5, it uses the same terminal buffer
-- - [ ] make formatters and runFile asynchronous
