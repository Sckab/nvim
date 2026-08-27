return {
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"mfussenegger/nvim-lint",
			{ "williamboman/mason.nvim", opts = {} },
			"rshkarin/mason-nvim-lint",
			"jay-babu/mason-nvim-dap.nvim",
			"dmmulroy/ts-error-translator.nvim", -- this plugin is lowkey useful
			{
				"MysticalDevil/inlay-hints.nvim",
				event = "LspAttach",
				opts = {},
			},
		},
		config = function()
			local navic = require("nvim-navic")

			require("mason").setup()

			require("mason-nvim-dap").setup({
				ensure_installed = { "codelldb" },
			})

			require("mason-nvim-lint").setup({
				automatic_installation = false,
				ensure_installed = {
					"markdownlint",
					"jsonlint",
					"ruff",
				},
			})

			require("lint").linters_by_ft = {
				markdown = { "markdownlint" },
				json = { "jsonlint" },
				python = { "ruff" },
				cmake = { "cmake_lint" },
			}

			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"astro",
					"html",
					"cssls",
					"ts_ls",
					"tailwindcss",
					"csharp_ls",
					"bashls",
					"taplo",
					"jsonls",
					"lemminx",
					"marksman",
					"pyright",
					"gopls",
					"clangd",
					"biome",
					"gh_actions_ls",
					"gitlab_ci_ls",
					"emmet_language_server",
					"asm_lsp",
					"zls",
					"mdx_analyzer",
					"neocmake",
					"rust_analyzer",
					"vue_ls",
					"qmlls",
				},
			})

			local lsps = {
				"astro",
				"cssls",
				"csharp_ls",
				"bashls",
				"taplo",
				"jsonls",
				"lemminx",
				"marksman",
				"pyright",
				"gopls",
				"clangd",
				"html",
				"asm_lsp",
				"zls",
				"mdx_analyzer",
				"neocmake",
				"rust_analyzer",
				"vue_ls",
			}

			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						diagnostics = {
							globals = {
								"vim",
								"hl",
							},
						},
						workspace = {
							library = { "/usr/share/nvim/runtime/lua" },
						},
					},
				},

				on_attach = function(client, bufnr)
					navic.attach(client, bufnr)
				end,
			})

			vim.lsp.config("ts_ls", {
				filetypes = {
					"typescript",
					"javascript",
					"javascriptreact",
					"typescriptreact",
					"vue",
				},

				init_options = {
					plugins = {
						{
							name = "@vue/typescript-plugin",
							location = vim.fn.stdpath("data")
								.. "/mason/packages/vue-language-server/node_modules/@vue/language-server",
							languages = { "vue" },
							configNamespace = "typescript",
						},
					},
				},
			})

			local root_dir = vim.fs.root(0, { "pyproject.toml", ".venv", ".git" })

			vim.lsp.config("qmlls", {
				cmd = {
					vim.fs.joinpath(root_dir, ".venv/lib/python3.12/site-packages/PySide6/qmlls"),
					"-I",
					vim.fs.joinpath(root_dir, ".venv/lib/python3.12/site-packages/PySide6/Qt/qml"),
				},

				filetypes = { "qml" },
				root_markers = { ".git" },
			})

			for _, lsp in ipairs(lsps) do
				vim.lsp.config(lsp, {
					on_attach = function(client, bufnr)
						navic.attach(client, bufnr)
					end,
				})
			end
		end,
	},
}
