return {
	{
		"numToStr/Comment.nvim",
		opts = {},
	},
	{
		"folke/todo-comments.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		opts = {
			signs = false,

			keywords = {
				FIX = { color = "error", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
				TODO = { color = "info" },
				HACK = { color = "warning" },
				WARN = { color = "warning", alt = { "WARNING", "XXX" } },
				PERF = { alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
				NOTE = { color = "hint", alt = { "INFO" } },
				TEST = { color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
			},

			merge_keywords = true,
		},
	},
	{ "LudoPinelli/comment-box.nvim" },
}
