return {
	{
		"lucobellic/edgy-group.nvim",
		event = "VeryLazy",
		dependencies = { "folke/edgy.nvim" },
		keys = {
			{
				"<leader>gp",
				function()
					require("edgy-group.stl").pick()
				end,
				desc = "Edgy Group Pick",
			},
		},
		opts = {
			groups = {
				left = {
					{ icon = "", titles = { "Neo-Tree" } },
					{ icon = "", titles = { "DB" } },
				},
				right = {
					{ icon = "", titles = { "Outline" } },
				},
				bottom = {
					{ icon = "", titles = { "Terminal" } },
					{ icon = "", titles = { "Overseer" } },
				},
			},
			statusline = {
				separators = { " ", " " },
				clickable = true,
			},
		},
	},
	{
		"folke/edgy.nvim",
		opts = {
			left = {
				{
					title = "Neo-Tree",
					ft = "neo-tree",
					filter = function(buf)
						return vim.b[buf].neo_tree_source == "filesystem"
					end,
					size = { width = 31 },
					open = "Neotree toggle",
					wo = {
						winbar = "",
					},
				},
				{
					title = "DB",
					size = { height = 20 },
					ft = "dbee",
					open = "Dbee toggle",
					wo = {
						winbar = "",
					},
				},
			},
			right = {
				{
					title = "Outline",
					ft = "Outline",
					open = "Outline",
					wo = {
						winbar = "",
					},
				},
			},
			bottom = {
				{
					title = "Terminal",
					ft = "toggleterm",
					size = { height = 20 },
					open = "ToggleTerm size=20 direction=horizontal",
					wo = {
						winbar = "",
					},
				},
				{
					title = "Overseer",
					ft = "Overseerlist",
					size = { height = 20 },
					open = "OverseerToggle",
					wo = {
						winbar = "",
					},
				},
			},
			animate = {
				enabled = false,
			},
		},
	},
}
