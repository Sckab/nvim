return {
	{ "SCSDC-co/gh-templates.nvim", dependencies = { "MunifTanjim/nui.nvim" }, opts = {} },
	{
		"lewis6991/gitsigns.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
			numhl = false,
			linehl = false,
			watch_gitdir = {
				interval = 1000,
				follow_files = true,
			},
			current_line_blame = false,
			sign_priority = 6,
			update_debounce = 100,
			status_formatter = nil,
			word_diff = false,
		},
	},
	{
		"rbong/vim-flog",
		dependencies = {
			"tpope/vim-fugitive",
		},
		cmd = { "Flog", "Flogsplit", "Floggit" },
		keys = {
			{ "<leader>gl", "<cmd>Flog<cr>", desc = "Git Log (Flog)" },
			{ "<leader>gL", "<cmd>Flogsplit<cr>", desc = "Git Log Split (Flog)" },
		},
		config = function()
			vim.g.flog_permanent_default_opts = {
				max_count = 2000,
				all = true,
				graph = true,
				format = "%C(auto)%h %C(bold blue)%an %C(reset)%C(green)(%ar) %C(reset)%s%C(auto)%d",
				date = "relative",
			}

			vim.g.flog_enable_dynamic_branch_hl = true
			vim.g.flog_enable_dynamic_commit_hl = true
			vim.g.flog_enable_extended_chars = true
			vim.g.flog_enable_extra_padding = true

			vim.g.flog_default_opts = {
				graph = true,
				all = true,
			}

			vim.api.nvim_create_autocmd("FileType", {
				pattern = "flog",
				callback = function()
					local opts = { buffer = true, silent = true }

					vim.keymap.set("n", "q", "<cmd>q<cr>", opts)
					vim.keymap.set("n", "<Tab>", "<Plug>(FlogVNextCommitRight)", opts)
					vim.keymap.set("n", "<S-Tab>", "<Plug>(FlogVPrevCommitRight)", opts)

					vim.keymap.set("n", "gb", "<Plug>(FlogVDiffRight)", opts)
					vim.keymap.set("n", "gs", "<Plug>(FlogVSplitRight)", opts)
					vim.keymap.set("n", "gd", "<Plug>(FlogVDiff)", opts)
					vim.keymap.set("n", "go", "<Plug>(FlogVOpen)", opts)

					vim.keymap.set("n", "<CR>", "<Plug>(FlogVOpen)", opts)
					vim.keymap.set("n", "o", "<Plug>(FlogVOpen)", opts)
				end,
			})
		end,
	},
}
