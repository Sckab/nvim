return {
	"akinsho/bufferline.nvim",
	lazy = true,
	event = "VeryLazy",
	version = "*",
	dependencies = {
		"nvim-mini/mini.icons",
	},
	config = function()
		local mini_icons = require("mini.icons")
		mini_icons.mock_nvim_web_devicons()

		require("bufferline").setup({
			options = {
				mode = "buffers",
				diagnostics = "nvim_lsp",
				show_buffer_close_icons = false,
				show_close_icon = false,
				separator_style = "thin",
				always_show_bufferline = false,

				offsets = {
					{
						filetype = "neo-tree",
						text = "",
						text_align = "left",
						separator = true,
						highlight = "BufferLineOffset",
						separator_highlight = "BufferLineOffsetSeparator",
					},
				},
			},
		})

		vim.keymap.set("n", "<S-l>", "<Cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })
		vim.keymap.set("n", "<S-h>", "<Cmd>BufferLineCyclePrev<CR>", { desc = "Prev buffer" })

		vim.keymap.set("n", "<leader>h", "<Cmd>tabprevious<CR>", { desc = "Previous tab" })
		vim.keymap.set("n", "<leader>l", "<Cmd>tabnext<CR>", { desc = "Next tab" })
	end,
}
