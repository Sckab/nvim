return {
	"rachartier/tiny-code-action.nvim",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{
			"folke/snacks.nvim",
			opts = {
				terminal = {},
			},
		},
	},
	event = "LspAttach",
	keys = {
		{
			"<leader>Ca",
			function()
				require("tiny-code-action").code_action()
			end,
			mode = { "n", "x" },
			desc = "Code Action",
			noremap = true,
			silent = true,
		},
	},
	opts = {
		backend = "vim",
		picker = "snacks",

		backend_opts = {
			delta = {
				header_lines_to_remove = 4,

				args = {
					"--line-numbers",
				},
			},
			difftastic = {
				header_lines_to_remove = 1,

				args = {
					"--color=always",
					"--display=inline",
					"--syntax-highlight=on",
				},
			},
			diffsofancy = {
				header_lines_to_remove = 4,
			},
		},

		signs = {
			quickfix = { "", { link = "DiagnosticWarning" } },
			others = { "", { link = "DiagnosticWarning" } },
			refactor = { "", { link = "DiagnosticInfo" } },
			["refactor.move"] = { "󰪹", { link = "DiagnosticInfo" } },
			["refactor.extract"] = { "", { link = "DiagnosticError" } },
			["source.organizeImports"] = { "", { link = "DiagnosticWarning" } },
			["source.fixAll"] = { "󰃢", { link = "DiagnosticError" } },
			["source"] = { "", { link = "DiagnosticError" } },
			["rename"] = { "󰑕", { link = "DiagnosticWarning" } },
			["codeAction"] = { "", { link = "DiagnosticWarning" } },
		},
	},
}
