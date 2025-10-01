return {
	"ggandor/leap.nvim",
	lazy = true,
	config = function()
		require("leap").add_default_mappings()
	end,
}
