local function clock()
	return os.date("%H:%M")
end

local function formatters()
	local conform = require("conform")
	local formatters = conform.list_formatters_to_run(0)

	if #formatters == 0 then
		return ""
	end

	return "󰉿 "
		.. table.concat(
			vim.tbl_map(function(formatter)
				return formatter.name
			end, formatters),
			" "
		)
end

local function linters()
	local lint = require("lint")
	local ft = vim.bo.filetype
	local names = lint.linters_by_ft[ft]

	if not names or #names == 0 then
		return ""
	end

	return "󰦕 " .. table.concat(names, ", ")
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
				lualine_c = {
					{
						"encoding",
						separator = { left = "", right = "" },
					},
					{
						"%=",
						separator = { left = "", right = "" },
					},
					{
						function()
							local stl = require("edgy-group.stl")
							local left_line = stl.get_statusline("left")
							local right_line = stl.get_statusline("right")
							local bottom_line = stl.get_statusline("bottom")

							return table.concat(left_line)
								.. table.concat(right_line)
								.. table.concat(bottom_line)
						end,
						separator = { left = "", right = "" },
					},
				},
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
				lualine_b = { "filetype" },
				lualine_c = {
					{
						"navic",
						color_correction = "dynamic",
					},
				},
				lualine_x = {},
				lualine_y = { formatters, linters },
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
				"lazy",
				"mason",
			},
		})
	end,
}
