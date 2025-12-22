return {
	"nvim-zh/colorful-winsep.nvim",
	event = { "WinLeave" },
	config = function()
		require("colorful-winsep").setup({
			border = "single",
			excluded_ft = { "lazy", "neo-tree", "TelescopePrompt", "mason", "snacks_dashboard" },
			highlight = nil,
			animate = {
				enabled = "false",
				shift = {
					delta_time = 0.1,
					smooth_speed = 1,
					delay = 3,
				},
				progressive = {
					vertical_delay = 20,
					horizontal_delay = 2,
				},
			},
			indicator_for_2wins = {
				position = "center",
				symbols = {
					start_left = "󱞬",
					end_left = "󱞪",
					start_down = "󱞾",
					end_down = "󱟀",
					start_up = "󱞢",
					end_up = "󱞤",
					start_right = "󱞨",
					end_right = "󱞦",
				},
			},
		})
	end,
}
