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
		dependencies = { "rafamadriz/friendly-snippets", "L3MON4D3/LuaSnip", version = "v2.*" },

		version = "1.*",

		build = "cargo build --release",

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			keymap = { preset = "super-tab" },

			snippets = { preset = "luasnip" },

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

		opts_extend = { "sources.default" },

		config = function(_, opts)
			local blink = require("blink.cmp")
			blink.setup(opts)

			local capabilities = blink.get_lsp_capabilities()
			vim.lsp.config("*", { capabilities = capabilities })
		end,
	},
}
