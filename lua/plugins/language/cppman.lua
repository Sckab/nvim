return {
	"simonwinther/cppman.nvim",
	version = "*",
	cmd = "CPPMan",
	dependencies = {
		"folke/snacks.nvim",
	},
	opts = {
		picker = {
			provider = "snacks",
		},

		viewer = { border = "rounded" },
	},
	init = function()
		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "cpp", "c" },
			callback = function(args)
				vim.keymap.set("n", "<leader>cu", function()
					require("cppman").open_for(vim.fn.expand("<cword>"))
				end, { buffer = args.buf, desc = "[C++] open under cursor" })

				vim.keymap.set("n", "<leader>ck", function()
					require("cppman").search()
				end, { buffer = args.buf, desc = "[C++] keyword search" })
			end,
		})
	end,
}
