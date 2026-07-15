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
					"angularls",
					"gh_actions_ls",
					"gitlab_ci_ls",
					"emmet_language_server",
					"asm_lsp",
					"zls",
					"mdx_analyzer",
					"neocmake",
					"rust_analyzer",
				},
			})

			local lsps = {
				"astro",
				"cssls",
				"ts_ls",
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
					},
				},

				on_attach = function(client, bufnr)
					navic.attach(client, bufnr)
				end,
			})

			for _, lsp in ipairs(lsps) do
				vim.lsp.config(lsp, {
					on_attach = function(client, bufnr)
						navic.attach(client, bufnr)
					end,
				})
			end

			-- setup qmlls, since it isn't present in the mason register
			vim.lsp.enable("qmlls")

			vim.lsp.config("qmlls", {
				cmd = { "qmlls" },
				filetypes = { "qml", "qmljs" },
				root_markers = { ".git" },
			})
		end,
	},
}
