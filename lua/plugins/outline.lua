return {
	"hedyhli/outline.nvim",
	lazy = false,
	cmd = { "Outline", "OutlineOpen" },
	keys = {
		{ "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
	},
	opts = {
		outline_window = {
			focus_on_open = false,
		},

		guides = {
			enabled = true,
			markers = {
				bottom = "╰",
				middle = "├",
				vertical = "│",
			},
		},
	},
}
