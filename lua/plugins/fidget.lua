return {
	"j-hui/fidget.nvim",
	event = "LspAttach",
	config = function()
		require("fidget").setup({
			text = {
				spinner = "dots",
				done = "✔",
				commenced = "Iniziato",
				completed = "Completato",
			},
			align = {
				bottom = true,
				right = true,
			},
			window = {
				blend = 0,
			},
			fmt = {
				leftpad = true,
				max_width = 50,
			},
		})
	end,
}
