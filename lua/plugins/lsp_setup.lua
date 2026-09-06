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
                    "emmet_ls",
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
            -- emmet_ls:
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities.textDocument.completion.completionItem.snippetSupport = true

            vim.lsp.config("emmet_ls", {
                -- on_attach = on_attach,
                capabilities = capabilities,
                filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "svelte", "pug", "typescriptreact", "vue" },
                init_options = {
                    html = {
                        options = {
                            -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
                            ["bem.enabled"] = true,
                        },
                    },
                }
            })
        end,
    },
}
