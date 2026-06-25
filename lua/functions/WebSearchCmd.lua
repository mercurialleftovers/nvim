local Q = "query_here"
local engines = {
    g = "https://www.google.com/search?query=" .. Q .. "&udm=14",
    d = "https://www.duckduckgo.com/search?query=" .. Q .. "&udm=14",
    gem = "https://gemini.google.com/app", 
}

local DEBUG = true

function web_search(inp)
    local fargs = inp.fargs
    local cmd = nil
    if #fargs == 1 then
        cmd = engines[fargs[1]]
    else

        local engine = fargs[1] 
        local query = fargs[2]

        for i = 3, #fargs do
            query = query .. '+' .. fargs[i]
        end

        cmd = vim.fn.substitute(engines[engine], Q, query, 'g')
        -- cmd = '"' .. vim.fn.escape(cmd, '&') .. '"'
        cmd = '"' .. cmd .. '"'
    end

    local start = nil

    if vim.fn.has('win32') then
        cmd = '"" ' .. cmd
        start = '!start '
    else
        start = '!xdg-open '
    end

    vim.cmd(start .. cmd)
end

local aliases = {"WS", "Ws"}

for i =1, #aliases do
    vim.api.nvim_create_user_command(
        aliases[i],
        web_search,
        {
            nargs='*',
            desc = "a shortcut to search the web",
            force = true,
        }
    )
end
