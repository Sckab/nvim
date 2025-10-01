return {
	"lewis6991/gitsigns.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("gitsigns").setup({
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
			numhl = false,
			linehl = false,
			watch_gitdir = {
				interval = 1000,
				follow_files = true,
			},
			current_line_blame = false,
			sign_priority = 6,
			update_debounce = 100,
			status_formatter = nil,
			word_diff = false,
		})
	end,
}
