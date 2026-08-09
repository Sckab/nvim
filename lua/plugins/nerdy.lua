return {
	"2kabhishek/nerdy.nvim",
	dependencies = {
		"folke/snacks.nvim",
	},
	cmd = "Nerdy",
	opts = {
		max_recents = 30,
		copy_to_clipboard = false,
	},
	keys = {
		{ "<leader>in", "<cmd>Nerdy list<CR>", desc = "Browse nerd icons" },
		{ "<leader>iN", "<cmd>Nerdy recents<CR>", desc = "Browse recent nerd icons" },
	},
}
