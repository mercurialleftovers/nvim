return {
    {
        "windwp/nvim-ts-autotag",
        config = function()
            -- Maps the 'htmldjango' filetype to the 'html' Treesitter parser
            vim.treesitter.language.register('html', 'htmldjango')

            require('nvim-ts-autotag').setup({
                opts = {
                    -- Defaults
                    enable_close = true,          -- Auto close tags
                    enable_rename = true,         -- Auto rename pairs of tags
                    enable_close_on_slash = false -- Auto close on trailing </
                },
                aliases = {
                    ["htmldjango"] = "html", -- TODO(bader): did not work!
                },
                -- Also override individual filetype configs, these take priority.
                -- Empty by default, useful if one of the "opts" global settings
                -- doesn't work well in a specific filetype
                per_filetype = {
                    -- ["html"] = {
                    --     enable_close = false
                    -- }
                }
            })
        end,
    }
}
