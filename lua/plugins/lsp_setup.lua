return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup()
        end,
    },
    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
            library = {
                -- See the configuration section for more details
                -- Load luvit types when the `vim.uv` word is found
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        opts = {
            auto_install = true,
        },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "pyright",
                    "ruff",
                    "clangd",
                    "lua_ls",
                },
            })

            -- setup:
            --
            -- ruff:
            local ruff_config =
            {
                cmd = { 'ruff', 'server' },
                filetypes = { 'python' },
                root_markers = { 'pyproject.toml', 'ruff.toml', '.ruff.toml', '.git' },
                init_options = {
                    settings = {
                        -- Ruff language server settings go here

                        configurationPreference = "filesystemFirst",
                    }
                }

            } 
            vim.lsp.config("ruff", ruff_config) -- the root markers will autotriger ruff, so don't config unless you plan on using it
            -- vim.lsp.enable("ruff")

            -- pyright:
            -- vim.lsp.enable("pyright") -- config is loaded from nvim/lsp/pyright.lua
            -- lua-language-server
            -- vim.lsp.enable("lua-language-server") -- config is loaded from nvim/lsp/lua_ls.lua
        end,
    },
}
