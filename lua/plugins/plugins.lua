return {
	{
		'nvim-mini/mini.icons',
		version = '*',
		config = function()
			require("mini.icons").setup()
			MiniIcons.mock_nvim_web_devicons()
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
			vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = 'Telescope find files' })
			vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
			vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
			vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })

			-- disabling auto-completion
			vim.api.nvim_create_autocmd({ "BufEnter" }, {
				pattern = "prompt",
				-- callback = function() vim.buf.opt.autocompletion = false end
				callback = function()
					print("prompt buf detected"); vim.cmd("setlocal noautocomplete")
				end
			})
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
				ensure_installed = { "lua_ls", "pyright", "ruff", "clangd", "tinymist", "emmet_ls", "biome", "harper_ls", "jinja_lsp", "tailwindcss", "superhtml", },
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

			-- harper_ls
			vim.lsp.config("harper_ls", {
				filetypes = { "typst, markdown, text, tex, html" } })
		end
	},
	-- lazy def to identify lua globals by the lsp
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
		'nvim-treesitter/nvim-treesitter',
		lazy = false,
		build = ':TSUpdate',
		config = function()
			local treesitter = require("nvim-treesitter")
			treesitter.setup {
				-- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
				install_dir = vim.fn.stdpath('data') .. '/site'
			}
			treesitter.install { "typescript", "javascript", "css", "html" }
		end
	},
	-- {
	-- 	"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
	-- 	config = function()
	-- 		require("lsp_lines").setup()
	-- 	end,
	-- },
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		---@module "ibl"
		---@type ibl.config
		opts = {},
		config = function()
			local highlight = {
				"RainbowRed",
				"RainbowYellow",
				"RainbowBlue",
				"RainbowOrange",
				"RainbowGreen",
				"RainbowViolet",
				"RainbowCyan",
			}

			local hooks = require "ibl.hooks"
			-- create the highlight groups in the highlight setup hook, so they are reset
			-- every time the colorscheme changes
			hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
				vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
				vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
				vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
				vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
				vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
				vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
				vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
			end)

			require("ibl").setup { indent = { highlight = highlight } }
		end
	},
	{

		"dgrco/deepwater.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("deepwater")
		end,
	}
}
