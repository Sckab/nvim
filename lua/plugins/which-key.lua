return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = function()
		local wk = require("which-key")

		wk.setup({
			plugins = {
				marks = true,
				registers = true,
				spelling = { enabled = true, suggestions = 20 },
				presets = {
					operators = true,
					motions = true,
					text_objects = true,
					windows = true,
					nav = true,
					z = true,
					g = true,
				},
			},
			layout = {
				height = { min = 4, max = 25 },
				width = { min = 20 },
				spacing = 3,
			},
			win = {
				row = nil,
				col = nil,
				border = "solid",
				no_overlap = true,
				padding = { 1, 2 },
				title = true,
				title_pos = "center",
			},
			show_help = true,
			show_keys = true,
		})
	end,
}
