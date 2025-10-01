return {
	"smjonas/inc-rename.nvim",
	event = "LspAttach",
	opts = {
		cmd_name = "IncRename",
		hl_group = "Substitute",
		preview_empty_name = false,
		show_message = true,
		save_in_cmdline_history = true,
		post_hook = nil,
	},
	init = function()
		vim.keymap.set("n", "<leader>rn", function()
			return ":IncRename " .. vim.fn.expand("<cword>")
		end, {
			expr = true,
			desc = "󰑕 Incremental Rename",
		})

		vim.keymap.set("v", "<leader>rn", function()
			return ":IncRename " .. vim.fn.expand("<cword>")
		end, {
			expr = true,
			desc = "󰑕 Incremental Rename (Visual)",
		})
	end,
	config = function(_, opts)
		require("inc_rename").setup(opts)
	end,
}
