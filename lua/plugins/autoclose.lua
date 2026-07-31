return {
    {
        'm4xshen/autoclose.nvim',
        config = function()
            local autoclose = require("autoclose")
            autoclose.setup()
            vim.keymap.set("i", "<f11>", autoclose.toggle)
        end
    }
}
