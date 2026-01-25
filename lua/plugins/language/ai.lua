return {
	"olimorris/codecompanion.nvim",
	version = "^18.0.0",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"MeanderingProgrammer/render-markdown.nvim",
		"franco-ruggeri/codecompanion-spinner.nvim",
	},
	opts = {
		interactions = {
			chat = {
				adapter = {
					name = "ollama",
					model = "deepseek-coder-v2:16b",
				},
			},

			inline = {
				adapter = {
					name = "ollama",
					model = "deepseek-coder-v2:16b",
				},
			},

			cmd = {
				adapter = {
					name = "ollama",
					model = "deepseek-coder-v2:16b",
				},
			},

			background = {
				adapter = {
					name = "ollama",
					model = "deepseek-coder-v2:16b",
				},
			},
		},

		extensions = {
			spinner = {},
		},
	},
}
