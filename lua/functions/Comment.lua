
local spaces = [[\(\s*\)]]
local letters = [[\(.\+\)]]
local content = spaces .. letters
local patterns = {}

patterns["lua"] = "--" .. content .. "--"
patterns["c"] = "//" .. content
patterns["cpp"] = "//" .. content
patterns["js"] = "//" .. content
patterns["html"] = "<?-" .. content .."->"

function CommentLine()
    local line = vim.fn.getline('.')
    local commentedPattern = patterns[vim.o.filetype]
    local commentMatched = vim.fn.matchstr(line, commentedPattern)
    local commentBackPattern = nil-- akin to: [[/--\1\2--]], commentPattern->replace(spaces, \1), commentedPattern->replace(letters, \2)


    if commentMatched then
        -- uncomment
        vim.cmd("s/" .. commentedPattern .. [[/\1\2]])
    else
        -- TODO(bader): currently writing this line:
        vim.cmd("s/" .. content .. "/\1\2")
    end
end


vim.keymap.set('n', '<f12>', CommentLine)
vim.keymap.set('v', '<f12>', CommentLine)
