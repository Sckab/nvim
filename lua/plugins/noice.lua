return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("noice").setup({
			cmdline = {
				enabled = true,
				view = "cmdline_popup",
			},

			views = {
				cmdline_popup = {
					position = {
						row = 5,
						col = "50%",
					},
					size = {
						width = 60,
						height = "auto",
					},
					border = {
						style = "rounded",
						padding = { 0, 1 },
					},
					win_options = {
						winhighlight = "Normal:NoiceCmdlinePopup,FloatBorder:NoiceCmdlinePopupBorder",
					},
				},
			},

			presets = { inc_rename = true },
		})
	end,
}
