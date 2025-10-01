local highlight = {
	"RainbowRed",
	"RainbowYellow",
	"RainbowBlue",
	"RainbowOrange",
	"RainbowGreen",
	"RainbowViolet",
	"RainbowCyan",
}

vim.api.nvim_create_autocmd("ColorScheme", {
	callback = function()
		vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
		vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
		vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
		vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
		vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
		vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
		vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
	end,
})

return {
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {
			indent = { char = "│", tab_char = "│" },
			scope = { enabled = true, highlight = highlight },
			whitespace = { remove_blankline_trail = true },
			exclude = { filetypes = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy" } },
		},
		config = function(_, opts)
			local hooks = require("ibl.hooks")
			require("ibl").setup(opts)
			hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
		end,
	},
	{
		"HiPhish/rainbow-delimiters.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		event = "BufReadPost",
		config = function()
			local rainbow_delimiters = require("rainbow-delimiters")

			vim.g.rainbow_delimiters = {
				strategy = {
					[""] = rainbow_delimiters.strategy["global"],
					vim = rainbow_delimiters.strategy["local"],
				},
				query = {
					[""] = "rainbow-delimiters",
					lua = "rainbow-blocks",
				},
				highlight = {
					"RainbowDelimiterRed",
					"RainbowDelimiterYellow",
					"RainbowDelimiterBlue",
					"RainbowDelimiterOrange",
					"RainbowDelimiterGreen",
					"RainbowDelimiterViolet",
					"RainbowDelimiterCyan",
				},
			}

			vim.api.nvim_set_hl(0, "RainbowDelimiterRed", { fg = "#E06C75" })
			vim.api.nvim_set_hl(0, "RainbowDelimiterYellow", { fg = "#E5C07B" })
			vim.api.nvim_set_hl(0, "RainbowDelimiterBlue", { fg = "#61AFEF" })
			vim.api.nvim_set_hl(0, "RainbowDelimiterOrange", { fg = "#D19A66" })
			vim.api.nvim_set_hl(0, "RainbowDelimiterGreen", { fg = "#98C379" })
			vim.api.nvim_set_hl(0, "RainbowDelimiterViolet", { fg = "#C678DD" })
			vim.api.nvim_set_hl(0, "RainbowDelimiterCyan", { fg = "#56B6C2" })
		end,
	},
}
