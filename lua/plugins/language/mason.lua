return {
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			{ "williamboman/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("mason").setup()
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
				},
			})

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
			})
		end,
	},
}
