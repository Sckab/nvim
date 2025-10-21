local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		"navarasu/onedark.nvim",
		priority = 1000,
		config = function()
			local highlights_colorscheme = require("highlights-colorscheme")
			require("onedark").setup({
				style = "darker",
				transparent = false,
				term_colors = true,
				ending_tildes = false,
				cmp_itemkind_reverse = false,

				toggle_style_key = nil,
				toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "warmer", "light" },

				code_style = {
					comments = "none",
					keywords = "none",
					functions = "none",
					strings = "none",
					variables = "none",
				},

				highlights = highlights_colorscheme,

				diagnostics = {
					darker = true,
					undercurl = false,
					background = true,
				},
			})
			require("onedark").load()
		end,
	},

	{ import = "plugins" },
	{ import = "plugins.language" },

	-- Lazy.nvim configuration
	checker = { enabled = true },
	change_detection = { notify = false },
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
				"matchparen",
			},
		},
	},
})
