-- local cache_dir = vim.fn.expand("~/.ruff_cache")
local cache_dir = vim.fn.expand(TMPDIR .. "/.ruff_cache")

function RuffFormat(id, event, group, file, match, buff, data)
    if not vim.fn.executable('ruff') then
        return
    end

    local filename = vim.fn.expand('%:p')
    local ruff_cmd = "ruff format " .. filename .. " --cache-dir " .. cache_dir

    vim.fn.system(ruff_cmd)
    vim.fn.execute(":e!")
end

local py_autoformat_group = vim.api.nvim_create_augroup(
    "python_format_on_save", 
    {
        clear=true
    }
)

vim.api.nvim_create_autocmd(
    {
        "BufWritePost",
    },
    {
        pattern={'*.py'},
        callback=RuffFormat,
        group=py_autoformat_group,
    }
)



--local lsp_binary = "python"

if LSP then
    -- ref: https://www.reddit.com/r/neovim/comments/1jnaas9/vimlspconfigs_server_and_client_capabilities/
    -- LSP Configuration: Python
    -- Referenced from: https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/configs/pyright.lua
    local root_files = {
      'pyproject.toml',
      'setup.py',
      'setup.cfg',
      'requirements.txt',
      'Pipfile',
      'pyrightconfig.json',
      '.git',
    }

    -- Configuring LSPs
    -- https://docs.astral.sh/ruff/editors/settings
    --[[
    vim.lsp.config['ruff'] = {
      cmd = { 'ruff', 'server' },
      filetypes = { 'python' },
      root_markers = root_files,
      init_options = {
        settings = {
          lineLength = 88,          -- Black
          showSyntaxErrors = false, -- Redundant (handled by Pyright)
          lint = {
            -- Linter Configuration: These are the linters that I think will be
            -- able to identify most of the code smells. These linters are non-
            -- overlapping with Pyright's linting.
            --
            -- To know more about linters supported by Ruff, execute: ruff linter
            select = { 'E', 'I', 'SIM', 'B', 'S', 'N' },
          },
          format = {
            preview = true,
          },
        },
      },
    }
    --]]

    -- Configuring Pyright
    vim.lsp.config['pyright'] = {
      cmd = { 'pyright-langserver', '--stdio' },
      filetypes = { 'python' },
      root_markers = root_files,
      settings = {
        pyright = {
          disableOrganizeImports = true,
        },
        python = {
          analysis = {
            autoSearchPaths = true,
            useLibraryCodeForTypes = true,
            diagnosticMode = 'openFilesOnly',
          },
        },
      },
    }

    -- Enable LSPs
    vim.lsp.enable('ruff')
    vim.lsp.enable('pyright')
end
