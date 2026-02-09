return {
	{
		"L3MON4D3/LuaSnip",
		dependencies = { "rafamadriz/friendly-snippets" },
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
			require("luasnip.loaders.from_vscode").lazy_load({
				paths = { vim.fn.stdpath("config") .. "/snippets" },
			})
		end,
	},
	{
		"saghen/blink.cmp",
		dependencies = {
			"L3MON4D3/LuaSnip",
			{
				"Kaiser-Yang/blink-cmp-dictionary",
				dependencies = { "nvim-lua/plenary.nvim" },
			},
		},

		version = "1.*",

		build = "cargo build --release",

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			keymap = { preset = "default" },

			signature = { enabled = true },

			appearance = {
				nerd_font_variant = "normal",
			},

			cmdline = {
				keymap = { preset = "inherit" },
				completion = { menu = { auto_show = true } },
			},

			term = {
				enabled = true,
				menu = { auto_show = true },
				ghost_text = { enabled = true },
			},

			sources = {
				default = { "lsp", "snippets", "path", "buffer", "dictionary" },

				providers = {
					dictionary = {
						module = "blink-cmp-dictionary",
						name = "Dict",
						min_keyword_length = 3,
						opts = {
							dictionary_directories = { vim.fn.expand("~/.config/nvim/dicts/") },
						},
					},

					snippets = {
						preset = "luasnip",
					},
				},
			},

			completion = {
				menu = {
					draw = {
						columns = {
							{ "kind_icon", "label" },
							{ "source_name" },
						},
					},
				},

				documentation = {
					auto_show = true,
				},

				list = {
					selection = {
						preselect = true,
						auto_insert = true,
					},
				},

				trigger = {
					prefetch_on_insert = true,
				},

				accept = {
					auto_brackets = {
						enabled = true,
					},
				},

				ghost_text = {
					enabled = true,
				},
			},

			fuzzy = {
				implementation = "prefer_rust_with_warning",
				sorts = {
					function(a, b)
						local source_priority = {
							lsp = 4,
							snippets = 3,
							path = 2,
							buffer = 1,
							dictionary = 0,
						}

						local a_priority = source_priority[a.source_id]
						local b_priority = source_priority[b.source_id]
						if a_priority ~= b_priority then
							return a_priority > b_priority
						end
					end,
					"score",
					"sort_text",
				},
			},
		},

		config = function(_, opts)
			local blink = require("blink.cmp")
			blink.setup(opts)

			local capabilities = blink.get_lsp_capabilities()

			vim.lsp.config("*", { capabilities = capabilities })
		end,
	},
}
