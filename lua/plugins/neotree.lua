return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	lazy = true,
	keys = {
		{ "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toggle Neo-tree" },
	},
	cmd = { "Neotree" },
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			close_if_last_window = true,
			popup_border_style = "rounded",
			enable_git_status = true,
			enable_diagnostics = false,
			refresh_diagnostics_on_change = true,
			sort_case_insensitive = false,
			default_component_configs = {
				indent = {
					with_markers = true,
					highlight = "NeoTreeIndentMarker",
					with_expanders = true,
					expander_collapsed = "",
					expander_expanded = "",
					expander_highlight = "NeoTreeExpander",
					last_indent_marker = "│",
				},

				icon = {
					folder_closed = "",
					folder_open = "",
					folder_empty = "",
					default = "",
				},

				name = {
					trailing_slash = false,
					use_git_status_colors = false,
				},

				git_status = {
					symbols = {
						added = "󰐕",
						modified = "󰜥",
						deleted = "",
						renamed = "",
						untracked = "",
						ignored = "",
						unstaged = "",
						staged = "",
						conflict = "",
					},
				},
			},
			filesystem = {
				filtered_items = {
					visible = true,
					hide_dotfiles = false,
					hide_gitignored = false,
				},

				follow_current_file = { enabled = true },
				use_libuv_file_watcher = true,
				hijack_netrw_behavior = "open_default",
				group_empty_dirs = false,
				bind_to_cwd = false,

				cwd_target = {
					sidebar = "window",
					current = "window",
				},
			},
			window = {
				position = "left",
				width = 30,
				mappings = {
					["o"] = "open",
					["<CR>"] = "open",
					["l"] = "open",
					["h"] = "close_node",
					["v"] = "open_vsplit",
					["s"] = "open_split",
					["t"] = "open_tabnew",
					["a"] = "add",
					["d"] = "delete",
					["r"] = "rename",
					["R"] = "refresh",
					["q"] = "close_window",
				},
			},
			event_handlers = {
				{
					event = "neo_tree_buffer_enter",
					handler = function()
						vim.opt_local.foldcolumn = "0"

						vim.opt_local.signcolumn = "auto"
						local group = vim.api.nvim_create_augroup("NeoTreeCursorLine", { clear = true })

						vim.api.nvim_create_autocmd("WinEnter", {
							group = group,
							buffer = 0,
							callback = function()
								if vim.bo.filetype == "neo-tree" then
									vim.opt_local.cursorline = true
								end
							end,
						})

						vim.api.nvim_create_autocmd("WinLeave", {
							group = group,
							buffer = 0,
							callback = function()
								if vim.bo.filetype == "neo-tree" then
									vim.opt_local.cursorline = false
								end
							end,
						})
					end,
				},
			},
		})
	end,
}
