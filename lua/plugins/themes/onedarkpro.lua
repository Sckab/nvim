return {
	"navarasu/onedark.nvim",
	priority = 1000,
	config = function()
		local highlights_colorscheme = require("plugins.highlights.onedark-highlights")

		require("onedark").setup({
			style = "darker",
			transparent = false,
			term_colors = true,
			ending_tildes = false,
			cmp_itemkind_reverse = false,

			toggle_style_key = nil,
			toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "warmer", "light" },

			code_style = {
				comments = "none",
				keywords = "none",
				functions = "none",
				strings = "none",
				variables = "none",
			},

			highlights = highlights_colorscheme,

			diagnostics = {
				darker = true,
				undercurl = false,
				background = true,
			},
		})

		require("onedark").load()
	end,
}
