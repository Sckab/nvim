return {
	"rebelot/kanagawa.nvim",
	priority = 1000,
	config = function()
		local highlights_colorscheme = require("plugins.highlights.kanagawa-highlights")

		require("kanagawa").setup({
			compile = false,
			undercurl = false,
			commentStyle = {},
			functionStyle = {},
			keywordStyle = {},
			statementStyle = {},
			typeStyle = {},
			transparent = false,
			dimInactive = false,
			terminalColors = true,

			colors = {
				palette = {},
				theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
			},

			overrides = function(colors)
				return highlights_colorscheme
			end,

			theme = "dragon",
			background = {
				dark = "dragon",
				light = "lotus",
			},
		})
	end,
}
