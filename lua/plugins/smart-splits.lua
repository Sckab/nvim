return {
	"mrjones2014/smart-splits.nvim",
	keys = {
		{ "<C-h>", desc = " Move to left window (smart)" },
		{ "<C-j>", desc = " Move to below window (smart)" },
		{ "<C-k>", desc = " Move to above window (smart)" },
		{ "<C-l>", desc = " Move to right window (smart)" },
		{ "<A-h>", desc = "󰩨 Resize window left" },
		{ "<A-j>", desc = "󰩨 Resize window down" },
		{ "<A-k>", desc = "󰩨 Resize window up" },
		{ "<A-l>", desc = "󰩨 Resize window right" },
		{ "<C-Left>", desc = "󰩨 Resize window left" },
		{ "<C-Down>", desc = "󰩨 Resize window down" },
		{ "<C-Up>", desc = "󰩨 Resize window up" },
		{ "<C-Right>", desc = "󰩨 Resize window right" },
		{ "<leader>Wh", desc = "󰓡 Swap window left" },
		{ "<leader>Wj", desc = "󰓢 Swap window down" },
		{ "<leader>Wk", desc = "󰓢 Swap window up" },
		{ "<leader>Wl", desc = "󰓡 Swap window right" },
	},
	config = function()
		local smart_splits = require("smart-splits")

		smart_splits.setup({
			ignored_buftypes = {
				"nofile",
				"quickfix",
				"prompt",
			},

			ignored_filetypes = {
				"NvimTree",
				"neo-tree",
				"sagaoutline",
				"aerial",
				"toggleterm",
				"TelescopePrompt",
				"spectre_panel",
			},
			default_amount = 3,
			at_edge = "wrap",
			move_cursor_same_row = false,
			cursor_follows_swapped_bufs = false,
			resize_mode = {
				quit_key = "<ESC>",
				resize_keys = { "h", "j", "k", "l" },
				silent = false,
				hooks = {
					on_enter = function()
						vim.notify("Entering resize mode... (ESC to exit)", vim.log.levels.INFO)
					end,
					on_leave = function()
						vim.notify("Exiting resize mode", vim.log.levels.INFO)
					end,
				},
			},

			ignored_events = {
				"BufEnter",
				"WinEnter",
			},
			multiplexer_integration = "tmux",
			disable_multiplexer_nav_when_zoomed = true,
		})

		vim.keymap.set("n", "<C-h>", smart_splits.move_cursor_left, { desc = " Move to left window (smart)" })
		vim.keymap.set("n", "<C-j>", smart_splits.move_cursor_down, { desc = " Move to below window (smart)" })
		vim.keymap.set("n", "<C-k>", smart_splits.move_cursor_up, { desc = " Move to above window (smart)" })
		vim.keymap.set("n", "<C-l>", smart_splits.move_cursor_right, { desc = " Move to right window (smart)" })

		vim.keymap.set("n", "<A-h>", smart_splits.resize_left, { desc = "󰩨 Resize window left" })
		vim.keymap.set("n", "<A-j>", smart_splits.resize_down, { desc = "󰩨 Resize window down" })
		vim.keymap.set("n", "<A-k>", smart_splits.resize_up, { desc = "󰩨 Resize window up" })
		vim.keymap.set("n", "<A-l>", smart_splits.resize_right, { desc = "󰩨 Resize window right" })

		vim.keymap.set("n", "<C-Left>", smart_splits.resize_left, { desc = "󰩨 Resize window left" })
		vim.keymap.set("n", "<C-Down>", smart_splits.resize_down, { desc = "󰩨 Resize window down" })
		vim.keymap.set("n", "<C-Up>", smart_splits.resize_up, { desc = "󰩨 Resize window up" })
		vim.keymap.set("n", "<C-Right>", smart_splits.resize_right, { desc = "󰩨 Resize window right" })

		vim.keymap.set("n", "<leader>Wh", smart_splits.swap_buf_left, { desc = "󰓡 Swap window left" })
		vim.keymap.set("n", "<leader>Wj", smart_splits.swap_buf_down, { desc = "󰓢 Swap window down" })
		vim.keymap.set("n", "<leader>Wk", smart_splits.swap_buf_up, { desc = "󰓢 Swap window up" })
		vim.keymap.set("n", "<leader>Wl", smart_splits.swap_buf_right, { desc = "󰓡 Swap window right" })
	end,
}
