return {
	"utilyre/barbecue.nvim",
	name = "barbecue",
	version = "*",
	dependencies = {
		"SmiteshP/nvim-navic",
		"nvim-tree/nvim-web-devicons",
	},
	opts = {},
	config = function()
		require("barbecue").setup({
			theme = {
				normal = { bg = "#1F2329" },

				dirname = { fg = "#E55561" },
			},
		})
	end,
}
