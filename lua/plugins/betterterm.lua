return {
	"CRAG666/betterTerm.nvim",
	lazy = true,
	keys = {
		{ "<F7>", desc = "🔧 VSCode-style Terminal" },
	},
	config = function()
		local betterTerm = require("betterTerm")

		betterTerm.setup({
			prefix = "BetterTerm_",
			startInsert = true,
			position = "bot",
			size = 15,
			border = "single",
			winhl = "Normal:TerminalNormal,FloatBorder:TerminalBorder",

			open_in_current_file_dir = true,
			remember_mode = true,
			auto_close = false,
		})

		vim.keymap.set("n", "<F7>", function()
			betterTerm.open()
		end, { desc = "🔧 VSCode-style Terminal" })

		vim.keymap.set("t", "<F7>", function()
			betterTerm.open()
		end, { desc = "Toggle Terminal" })

		vim.keymap.set("t", "<C-t>", function()
			local next_index = 1
			while vim.fn.bufexists("BetterTerm_" .. next_index) == 1 do
				next_index = next_index + 1
			end
			betterTerm.open(next_index)
		end, { desc = "New Terminal Tab" })

		vim.keymap.set("t", "<C-w>", function()
			vim.cmd("bd!")
		end, { desc = "Close Terminal Tab" })

		vim.keymap.set("t", "<C-Tab>", function()
			betterTerm.select()
		end, { desc = "Select Terminal" })

		for i = 1, 5 do
			vim.keymap.set("t", "<C-" .. i .. ">", function()
				betterTerm.open(i)
			end, { desc = "Terminal " .. i })
		end

		vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit Terminal Insert Mode" })

		vim.keymap.set("t", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Move to left window" })
		vim.keymap.set("t", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Move to below window" })
		vim.keymap.set("t", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Move to above window" })
		vim.keymap.set("t", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Move to right window" })

		vim.api.nvim_create_autocmd("TermOpen", {
			pattern = "*",
			callback = function()
				vim.opt_local.number = false
				vim.opt_local.relativenumber = false
				vim.opt_local.signcolumn = "no"

				vim.cmd("startinsert")
			end,
			desc = "Terminal setup",
		})
	end,
}
