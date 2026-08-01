return {
    {
        'nvim-telescope/telescope.nvim', version = '*',
        dependencies = {
            'nvim-lua/plenary.nvim',
            -- optional but recommended
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        },
        config = function()

            vim.keymap.set('n', '<leader>ff', require("telescope.builtin").find_files, {
                noremap = true,
                silent = true,
            })

            vim.keymap.set('n', '<leader>fw', require("telescope.builtin").live_grep, {
                noremap = true,
                silent = true,
            })

            vim.keymap.set('n', '<leader>fb', require("telescope.builtin").current_buffer_fuzzy_find, {
                noremap = true,
                silent = true,
            })

           vim.keymap.set('n', '<leader>en',
               function()
                   require("telescope.builtin").find_files {cwd = vim.fn.stdpath('config')}
               end
               ,{
                    noremap = true,
                    silent = true,
                }
            )
        end
    },
}
