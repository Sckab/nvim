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
		local colors = {}

		local current_colorscheme = vim.g.colors_name

		if current_colorscheme:match("kanagawa") then
			colors = {
				normal = { bg = "#181616" },
				dirname = { fg = "#FF9E3B" },
			}
		elseif current_colorscheme:match("onedark") then
			colors = {
				normal = { bg = "#1F2329" },
				dirname = { fg = "#E55561" },
			}
		end

		require("barbecue").setup({
			theme = {
				normal = { bg = colors.normal.bg, bold = true },
				dirname = { fg = colors.dirname.fg },
			},
		})
	end,
}
