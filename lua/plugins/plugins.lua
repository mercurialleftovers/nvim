return {
	{
		'nvim-mini/mini.icons',
		version = '*',
		config = function()
			require("mini.icons").setup()
		end,
	},
	{
		'nvim-mini/mini.pairs',
		version = '*',
		config = function()
			require("mini.pairs").setup()
		end,
	},
	{
		'nvim-mini/mini.surround',
		version = '*',
		config = function()
			require("mini.surround").setup()
		end,
	},
	{
		'nvim-mini/mini.files',
		version = '*',
		config = function()
			require("mini.files").setup()
		end,
	},
	-- { 'nvim-mini/mini.pairs', version = '*', config = function() require("mini.pairs").setup({modes = {insert = true, command = true, terminal = true}), },
	{ "https://github.com/m4xshen/autoclose.nvim", config = function() require("autoclose").setup() end },
	{
		'nvim-telescope/telescope.nvim',
		version = '*',
		dependencies = {
			'nvim-lua/plenary.nvim',
			-- optional but recommended
			{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
		},
		config = function()
			local builtin = require('telescope.builtin')
			vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
			vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
			vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
			vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
		end,
	},
	-- { "mason-org/mason.nvim", opts = {}, }, -- handled by dependencies
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("mason-lspconfig").setup {
				ensure_installed = { "lua_ls", "pyright", "ruff", "clangd", "tinymist" },
			}

			-- configuring lsp stuff
			local lsp_grp = vim.api.nvim_create_augroup("LspGroup", { clear = true })
			vim.api.nvim_create_autocmd("LspAttach", {
				group = lsp_grp,
				callback = function(ev)
					-- print("LspAttached :")
					-- print(vim.inspect(vim.lsp.get_clients({ bufnr = 0 })))
					local opts = { buffer = ev.buf }

					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
					vim.keymap.set("n", "<leader>i", vim.lsp.buf.implementation, opts)
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
					vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "<leader>D", vim.diagnostic.open_float, opts)
					vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
					vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
				end
			})

			-- autoformatting with lsp
			vim.api.nvim_create_autocmd(
				{
					"BufWritePre",
				},
				{
					pattern = { '*' },
					callback = function(args)
						if #vim.lsp.get_clients({ bufnr = 0 }) == 0 then return end
						vim.lsp.buf.format({ bufnr = args.buf })
					end,
					group = lsp_grp,
				}
			)
		end
	}
}
