local commentDict = {}

local CONTENT_GRP = '\(\S\+\)'
commentDict['c'] = '^\s*//\'
-- commentDict['c'] = '^\\s*//\(.*\)'
-- commentDict['cpp'] = '^\\s*//\(.*\)'
-- commentDict['lua'] = '^\\s*--\(.*\)'

-- print(vim.inspect(commentDict))
print(vim.fn.matchstr('hi how are you ?', 'hi'))

function CommentLine()
    local line = vim.fn.getline('.')
    local indent = vim.fn.indent('.')

    -- local cmtPattern = commentDict[vim.o.filetype]
    local cmtPattern = '^\\s*--\(.*\)'

    if vim.fn.matchstr(line, cmtPattern) then
        print(vim.fn.matchstr(line, cmtPattern))
        -- vim.fn.substitute(line, 
    else

    end
end

-- example comment

vim.keymap.set('n', '<f12>', '', {callback=CommentLine, noremap=true, silent=true})
