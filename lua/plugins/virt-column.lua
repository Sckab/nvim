return {
	"lukas-reineke/virt-column.nvim",
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		require("virt-column").setup({
			virtcolumn = "100",
			char = "│",
			highlight = "VirtColumn",
			enabled = true,
		})
	end,
}
