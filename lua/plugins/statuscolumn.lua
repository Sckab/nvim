return {
	"luukvbaal/statuscol.nvim",
	lazy = false,
	config = function()
		local builtin = require("statuscol.builtin")
		require("statuscol").setup({
			setopt = true,
			relculnr = true,
			relculright = false,
			bt_ignore = { "neo-tree", "aerial", "trouble", "help" },
			ft_ignore = { "neo-tree", "aerial", "trouble", "help", "dashboard" },
			segments = {
				{
					sign = { namespace = { "diagnostic/signs", "gitsigns" }, maxwidth = 2, colwidth = 2, auto = true },
					click = "v:lua.ScSa",
				},
				{
					text = { builtin.lnumfunc, " " },
					condition = { true, builtin.not_empty },
					click = "v:lua.ScLa",
				},
				{
					text = { builtin.foldfunc },
					condition = { builtin.not_empty },
					click = "v:lua.ScFa",
					hl = "FoldColumn",
				},
				{
					text = { " " },
					condition = { true },
					hl = "StatusColumnSeparator",
				},
			},
		})

		vim.opt.fillchars = {
			fold = " ",
			foldopen = "",
			foldclose = "",
			foldsep = "│",
			eob = " ",
		}
	end,
}
