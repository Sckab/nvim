return {
	"brenoprata10/nvim-highlight-colors",
	lazy = false,
	config = function()
		require("nvim-highlight-colors").setup({
			render = "virtual",
			virtual_symbol = "󱓻",
			virtual_symbol_prefix = "",
			virtual_symbol_suffix = " ",
			virtual_symbol_position = "inline",
			enable_hex = true,
			enable_short_hex = true,
			enable_rgb = true,
			enable_hsl = true,
			enable_var_usage = true,
			enable_named_colors = true,
			enable_tailwind = true,
		})
	end,
}
