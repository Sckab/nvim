local diagnostics = {}

function diagnostics.setup()
	local signs = {
		[vim.diagnostic.severity.ERROR] = "",
		[vim.diagnostic.severity.WARN] = "",
		[vim.diagnostic.severity.HINT] = "󰌵",
		[vim.diagnostic.severity.INFO] = "",
	}

	vim.diagnostic.config({
		virtual_text = false,
		signs = { text = signs },
		update_in_insert = true,
		severity_sort = true,
		underline = true,
		float = {
			show_header = true,
			source = "always",
			border = "rounded",
			prefix = function(diagnostic)
				local severity = vim.diagnostic.severity[diagnostic.severity]
				return signs[severity] .. " "
			end,
		},
	})
end

return {
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "VeryLazy",
		config = function()
			require("tiny-inline-diagnostic").setup({
				preset = "powerline",
				transparent_bg = false,
				transparent_cursorline = false,
				hi = {
					error = "DiagnosticError",
					warn = "DiagnosticWarn",
					info = "DiagnosticInfo",
					hint = "DiagnosticHint",
					arrow = "NonText",
					background = "CursorLine",
					mixing_color = "None",
				},
				options = {
					use_icons_from_diagnostic = true,
					multilines = { enabled = true, tabstop = 4 },
					enable_on_insert = true,
					virt_texts = { priority = 2 },
					severity = {
						vim.diagnostic.severity.ERROR,
						vim.diagnostic.severity.WARN,
						vim.diagnostic.severity.INFO,
						vim.diagnostic.severity.HINT,
					},
				},
			})

			diagnostics.setup()
		end,
	},
}
