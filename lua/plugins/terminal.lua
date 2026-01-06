return {
	"akinsho/toggleterm.nvim",
	version = "*",
	keys = {
		{
			"<leader>tt",
			function()
				vim.cmd([[ToggleTerm size=17 direction=horizontal]])
			end,
			mode = { "n" },
			desc = "Toggle Terminal",
			noremap = true,
			silent = true,
		},
	},
	opts = {
		shade_terminals = false,
	},
}
