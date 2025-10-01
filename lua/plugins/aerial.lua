return {
	"stevearc/aerial.nvim",
	cmd = "AerialToggle",
	keys = {
		{ "<leader>a", "<cmd>AerialToggle!<CR>", desc = "Toggle Aerial" },
	},
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("aerial").setup({
			placement = "edge",
			default_direction = "right",

			layout = {
				min_width = 40,
				max_width = 40,
			},

			show_guides = true,
			guides = {
				mid_item = "├─",
				last_item = "└─",
				nested_top = "│ ",
				whitespace = "  ",
			},

			icons = require("nvim-web-devicons").get_icons(),

			attach_mode = "global",
			backends = {
				["_"] = { "lsp", "treesitter", "markdown", "man" },
			},

			close_automatic_events = { "unsupported" },
			close_on_select = false,

			highlight_on_hover = true,
			highlight_on_jump = false,

			keymaps = {
				["<CR>"] = "actions.jump",
				["<C-v>"] = "actions.jump_vsplit",
				["<C-s>"] = "actions.jump_split",
				["p"] = "actions.scroll",
				["<C-h>"] = "<C-w>h",
				["<C-j>"] = "<C-w>j",
				["<C-k>"] = "<C-w>k",
				["<C-l>"] = "<C-w>l",
			},

			filter_kind = false,

			autojump = false,
			manage_folds = false,
			link_folds_to_tree = false,
			link_tree_to_folds = false,
			treesitter = {
				update_delay = 300,
			},
			lsp = {
				update_delay = 300,
				diagnostics_trigger_update = true,
			},
		})
	end,
}
