require("functions/RunFile")

local WINDOWS = vim.env.OS == "Windows_NT"
local build_file

if WINDOWS then
    build_file = "build.bat"
else
    build_file = "build.sh"
end

function findExec()
    local found = vim.fn.findfile(build_file, ".;", -3)

    if #found > 0 then
        return found[1]
    end

    return nil
end

function execBat()
    local fname = findExec()
    local dirname = vim.fn.fnamemodify(fname, ":h")

    if fname then
        -- buffer-local chdir(dirname)
        --
        vim.cmd(":tabnew")
        vim.cmd(":tcd " .. dirname)
        vim.cmd(":hor term " .. fname)
    else
        print("RunFile ...")
        RunFile()
    end

end


-- vim.keymap.set("n", "<f5>", execBat, {noremap=true, silent=true})
vim.keymap.set("n", "<f5>", execBat, {noremap=true})
