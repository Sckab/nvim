return {
	"chrisgrieser/nvim-scissors",
	dependencies = "nvim-telescope/telescope.nvim",
	opts = {
		snippetDir = vim.fn.stdpath("config") .. "/snippets",
	},
}
