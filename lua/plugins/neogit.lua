return {
	"NeogitOrg/neogit",
	lazy = true,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"sindrets/diffview.nvim",
		"nvim-telescope/telescope.nvim",
	},
	cmd = "Neogit",
	keys = {
		{ "<leader>gg", "<cmd>Neogit<cr>", desc = "Show Neogit UI" },
	},
	opts = {
		floating = {
			relative = "editor",
			width = 0.8,
			height = 0.7,
			border = "rounded",
		},

		kind = "floating",
		graph_style = "kitty",

		commit_editor = {
			kind = "floating",
		},
		commit_select_view = {
			kind = "floating",
		},
		commit_view = {
			kind = "floating",
			verify_commit = vim.fn.executable("gpg") == 1, -- Can be set to true or false, otherwise we try to find the binary
		},
		log_view = {
			kind = "floating",
		},
		rebase_editor = {
			kind = "auto",
		},
		reflog_view = {
			kind = "floating",
		},
		merge_editor = {
			kind = "auto",
		},
		preview_buffer = {
			kind = "floating_console",
		},
		popup = {
			kind = "floating",
			show_title = false,
		},
		stash = {
			kind = "floating",
		},
		refs_view = {
			kind = "floating",
		},
	},
}
