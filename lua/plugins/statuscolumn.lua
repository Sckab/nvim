return {
	"luukvbaal/statuscol.nvim",
	lazy = false,
	config = function()
		local builtin = require("statuscol.builtin")
		require("statuscol").setup({
			setopt = true,
			relculnr = true,
			relculright = false,
			bt_ignore = { "neo-tree", "aerial", "trouble", "help", "terminal" },
			ft_ignore = { "neo-tree", "aerial", "trouble", "help", "dashboard", "toggleterm", "codecompanion" },
			segments = {
				{
					sign = { namespace = { "gitsigns" }, colwidth = 2, auto = false },
					click = "v:lua.ScSa",
				},
				{
					sign = {
						namespace = { "diagnostic" },
						colwidth = 2,
						auto = false,
					},
					click = "v:lua.ScSa",
				},
				{
					text = { builtin.foldfunc },
					condition = { builtin.not_empty },
					click = "v:lua.ScFa",
					hl = "FoldColumn",
				},
				{
					text = { "  " },
					condition = { true },
					hl = "StatusColumnSeparator",
				},
			},
		})
	end,
}
