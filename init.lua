require('keymaps')
require('settings')
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
