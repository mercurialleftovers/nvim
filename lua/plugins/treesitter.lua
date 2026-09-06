return {
    {
        'nvim-treesitter/nvim-treesitter',
        lazy = false,
        build = ':TSUpdate',
        config = function()
            require('nvim-treesitter').install { 'python', 'javascript', 'java', 'c', 'cpp', 'html', 'css' }
        end
    },
}
