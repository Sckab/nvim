return {
	{
		"echasnovski/mini.comment",
		lazy = true,
		keys = {
			{ "gc", mode = { "n", "x" }, desc = "Comment toggle" },
			{ "gcc", mode = "n", desc = "Comment toggle current line" },
		},
		config = function()
			require("mini.comment").setup()
		end,
	},

	{
		"folke/todo-comments.nvim",
		lazy = true,
		event = "BufReadPost",
		dependencies = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup({
				signs = true,
				sign_priority = 8,
				keywords = {
					FIX = { icon = " ", color = "error", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
					TODO = { icon = " ", color = "info" },
					HACK = { icon = " ", color = "warning" },
					WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
					PERF = { icon = "󱓞 ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
					NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
					TEST = { icon = " ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
				},
				gui_style = {
					fg = "NONE",
					bg = "bold",
				},
				merge_keywords = true,
			})
		end,
	},
}
