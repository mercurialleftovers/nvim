-- source: https://www.youtube.com/watch?v=xVKpx1Zl3ac

local TEMP_FNAME = TMPDIR .. "/fzf_out.txt"
local term_window = nil
local og_window = vim.api.nvim_get_current_win()

function open_file()
    local fname = vim.fn.trim(vim.fn.readfile(TEMP_FNAME)[1])
    if fname == '' then
        return
    end
    local cmd = vim.fn.input('> ') ..  ' ' .. fname
    vim.notify(cmd)
    vim.api.nvim_set_current_win(og_window)
    vim.cmd(cmd)
    vim.api.nvim_win_close(
        term_window, -- window id (returned by nvim_open_window
        true -- force, as in: :q(!)
    )
    term_window = nil
end

local max_height = vim.api.nvim_win_get_height(0) -- 0 for current window
local max_width = vim.api.nvim_win_get_width(0) -- 0 for current window
local height=math.floor(max_height * 0.75)
local width=math.floor(max_width * 0.75)

local opts = {
    relative ="editor", -- relative to editor is like absolutely positioned
    height = height,
    width = width,
    col=(max_width - width) / 2, -- where to be placed: x-wise
    row=(max_height - height) / 2, --   where to be placed: y-wise
}

function startfuzzer()
    local buf = vim.api.nvim_create_buf(
        false, -- listed: we don't want it listed,
        true -- scatch: we don't want it persisting (it is temp)
    )
    term_window = vim.api.nvim_open_win(
        buf,
        true, -- enter: focus the window
        opts
    )
    vim.fn.termopen("fzf > " .. TEMP_FNAME, {on_exit=function() open_file(); end,})
    vim.cmd('startinsert')
end

vim.keymap.set('n', '<c-p>', '', {callback=startfuzzer, silent=true, noremap=true})
