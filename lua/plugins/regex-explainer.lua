return {
	"bennypowers/nvim-regexplainer",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"MunifTanjim/nui.nvim",
	},

	config = function()
		require("regexplainer").setup({
			mode = "narrative",

			auto = false,

			filetypes = {
				"html",
				"js",
				"cjs",
				"mjs",
				"ts",
				"jsx",
				"tsx",
				"cjsx",
				"mjsx",
			},

			debug = false,

			display = "popup",

			mappings = {
				toggle = "<leader>gR",
			},

			narrative = {
				indendation_string = "> ",
			},
		})
	end,
}
