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
		"rafamadriz/friendly-snippets",
		lazy = true,
	},
	{
		"saghen/blink.cmp",
		dependencies = {
			"rafamadriz/friendly-snippets",
			"L3MON4D3/LuaSnip",
			{ "Kaiser-Yang/blink-cmp-dictionary", dependencies = { "nvim-lua/plenary.nvim" } },
		},

		version = "1.*",

		build = "cargo build --release",

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			keymap = { preset = "super-tab" },

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
			},

			sources = {
				default = { "dictionary", "lsp", "path", "snippets", "buffer" },

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
						},
					},
				},

				documentation = {
					auto_show = true,
				},

				list = {
					selection = {
						preselect = function(ctx)
							return ctx.mode ~= "cmdline" and not require("blink.cmp").snippet_active({ direction = 1 })
						end,
						auto_insert = function(ctx)
							return ctx.mode == "cmdline"
						end,
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

			fuzzy = { implementation = "prefer_rust_with_warning" },
		},

		config = function(_, opts)
			local blink = require("blink.cmp")
			blink.setup(opts)

			local capabilities = blink.get_lsp_capabilities()
			vim.lsp.config("*", { capabilities = capabilities })
		end,
	},
}
