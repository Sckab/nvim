return {
	"neovim/nvim-lspconfig",
	config = function()
		vim.diagnostic.config({
			virtual_text = {
				enable = true,
				source = "always",
			},

			signs = {
				enable = true,
				text = {
					[vim.diagnostic.severity.ERROR] = "",
					[vim.diagnostic.severity.WARN] = "",
					[vim.diagnostic.severity.HINT] = "󰌵",
					[vim.diagnostic.severity.INFO] = "",
				},
			},

			update_in_insert = true,
			severity_sort = true,
			underline = true,

			float = {
				show_header = true,
				source = "always",
				border = "rounded",
			},
		})

		vim.keymap.set("n", "<leader>df", function()
			vim.diagnostic.open_float()
		end, { desc = "Open diagnostic float" })
	end,
}
