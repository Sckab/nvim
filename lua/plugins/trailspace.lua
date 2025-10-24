return {
	"nvim-mini/mini.trailspace",
	version = false,
	lazy = true,
	event = "BufReadPost",
	config = function()
		require("mini.trailspace").setup()
	end,
}
