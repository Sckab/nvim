return {
	"zaldih/themery.nvim",
	lazy = false,
	config = function()
		require("themery").setup({
			themes = {
				{
					name = "Onedark pro",
					colorscheme = "onedark",
				},
				{
					name = "Kanagawa dragon",
					colorscheme = "kanagawa-dragon",
				},
			},
			livePreview = true,
		})
	end,
}
