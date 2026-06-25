-- note taking, a temp buffer!
local buf = vim.api.nvim_create_buf(false, false)

local win = nil
local max_h = vim.api.nvim_win_get_height(0) -- 0 for current window
local max_w = vim.api.nvim_win_get_width(0) -- 0 for current window

local h = math.floor(max_h * .75)
local w = math.floor(max_w * .75)

local opts=  {
    relative = "editor",
    height=h,
    width=w,
    col=(max_w-w)/2,
    row=(max_h-h)/2,
}

function show_todo()
    if win then
        vim.api.nvim_win_close(win, true)
        win = nil
    else
        win = vim.api.nvim_open_win(buf, true, opts)
    end
end


vim.keymap.set('n', '<f6>', '', {callback=show_todo})
vim.keymap.set('i', '<f6>', '', {callback=show_todo})
-- todo buf specific keymaps:
-- vim.keymap.set('i', '<c-q>', '', {callback=show_todo}, buf)
-- vim.keymap.set('n', '<c-q>', '', {callback=show_todo}, buf)
