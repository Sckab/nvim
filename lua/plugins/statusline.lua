local function clock()
	return os.date("%H:%M")
end

return {
	"nvim-lualine/lualine.nvim",
	lazy = true,
	event = "VeryLazy",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("lualine").setup({
			options = {
				theme = "auto",
				icons_enabled = true,
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
				globalstatus = true,
				disabled_filetypes = {
					statusline = { "alpha", "snacks_dashboard" },
					winbar = { "snacks_dashboard", "neo-tree", "toggleterm" },
				},
			},

			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { "encoding" },
				lualine_x = {
					{
						"fileformat",
						symbols = {
							unix = " Unix",
							dos = " DOS",
							mac = " Mac",
						},
					},
				},
				lualine_y = { "progress", "location" },
				lualine_z = { clock },
			},

			winbar = {
				lualine_a = { "filename" },
				lualine_b = {},
				lualine_c = {
					{
						"navic",
						color_correction = "dynamic",
					},
				},
				lualine_x = {},
				lualine_y = { "filetype" },
				lualine_z = { "lsp_status" },
			},

			inactive_winbar = {
				lualine_a = { "filename" },
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = { "filetype" },
				lualine_z = { "lsp_status" },
			},

			extensions = {
				"neo-tree",
				"aerial",
				"lazy",
				"mason",
				"toggleterm",
			},
		})
	end,
}
