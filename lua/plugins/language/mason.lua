return {
	{ "dmmulroy/ts-error-translator.nvim" }, -- this plugin is lowkey useful
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			{ "williamboman/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
			"mfussenegger/nvim-lint",
			"rshkarin/mason-nvim-lint",
			"jay-babu/mason-nvim-dap.nvim",
		},
		config = function()
			local navic = require("nvim-navic")
			--[[
                since the `ensure_installed` list doesn't work,
                make sure to install these formatters:
                   black
                   clang-format
                   csharpier
                   goimports
                   shfmt
                   stylua
                   taplo
                   prettierd
                   asmfmt
                   gersemi
            ]]

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
					"cmakelint",
				},
			})

			require("lint").linters_by_ft = {
				markdown = { "markdownlint" },
				json = { "jsonlint" },
				python = { "ruff" },
				cmake = { "cmakelint" },
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
			}

			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						diagnostics = {
							globals = {
								"vim",
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
		end,
	},
}
