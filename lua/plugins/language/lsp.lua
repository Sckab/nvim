return {
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			{ "williamboman/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
		config = function()
			local navic = require("nvim-navic")
			require("mason").setup({
				ensure_installed = {
					"black",
					"clang-format",
					"csharpier",
					"goimports",
					"shfmt",
					"stylua",
					"taplo",
					"prettierd",
					"asmfmt",
					"mbake",
				},
			})
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
					"cmake",
					"biome",
					"angularls",
					"gh_actions_ls",
					"gitlab_ci_ls",
					"emmet_language_server",
					"asm_lsp",
					"zls",
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
				"cmake",
				"html",
				"asm_lsp",
				"zls",
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
