return {
	"echasnovski/mini.align",
	version = "*",
	event = "VeryLazy",
	keys = {
		{ "ga", mode = { "n", "v" }, desc = "Align" },
		{ "gA", mode = { "n", "v" }, desc = "Align with preview" },
	},
	config = function()
		require("mini.align").setup()
	end,
}
