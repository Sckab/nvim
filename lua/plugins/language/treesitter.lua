return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"lua",
				"astro",
				"html",
				"css",
				"javascript",
				"typescript",
				"bash",
				"c_sharp",
				"toml",
				"json",
				"xml",
				"yaml",
				"markdown",
				"python",
				"go",
				"gomod",
				"gosum",
				"gowork",
			},
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
