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
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
				globalstatus = true,
				disabled_filetypes = {
					statusline = { "alpha", "snacks_dashboard" },
					winbar = {},
				},
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { "filename" },
				lualine_x = { "encoding", "fileformat", "filetype" },
				lualine_y = { "progress", "location" },
				lualine_z = { clock },
			},
			extensions = {
				"neo-tree",
				"oil",
				"fugitive",
				"trouble",
				"quickfix",
				"toggleterm",
				"aerial",
				"lazy",
				"mason",
			},
		})
	end,
}
