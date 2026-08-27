return {
	"akinsho/toggleterm.nvim",
	version = "*",
	lazy = false,
	keys = {
		{
			"<leader>tt",
			function()
				vim.cmd([[ToggleTerm size=20 direction=horizontal]])
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
