return {
	"monaqa/dial.nvim",
	lazy = false,
	config = function()
		local augend = require("dial.augend")

		require("dial.config").augends:register_group({
			default = {
				augend.integer.alias.decimal,
				augend.integer.alias.hex,
				augend.date.alias["%Y/%m/%d"],
				augend.date.alias["%Y-%m-%d"],
				augend.date.alias["%m/%d/%Y"],
				augend.date.alias["%H:%M"],
				augend.constant.alias.bool,
				augend.constant.new({
					elements = { "and", "or" },
					word = true,
					cyclic = true,
				}),
				augend.constant.new({
					elements = { "&&", "||" },
					word = false,
					cyclic = true,
				}),
				augend.constant.new({
					elements = { "yes", "no" },
					word = true,
					cyclic = true,
				}),
				augend.constant.new({
					elements = { "on", "off" },
					word = true,
					cyclic = true,
				}),
				augend.constant.new({
					elements = { "enable", "disable" },
					word = true,
					cyclic = true,
				}),
				augend.constant.new({
					elements = { "enabled", "disabled" },
					word = true,
					cyclic = true,
				}),
				augend.constant.new({
					elements = { "left", "right" },
					word = true,
					cyclic = true,
				}),
				augend.constant.new({
					elements = { "up", "down" },
					word = true,
					cyclic = true,
				}),
				augend.constant.new({
					elements = { "top", "bottom" },
					word = true,
					cyclic = true,
				}),
				augend.constant.new({
					elements = { "width", "height" },
					word = true,
					cyclic = true,
				}),
				augend.constant.new({
					elements = { "horizontal", "vertical" },
					word = true,
					cyclic = true,
				}),
			},
			visual = {
				augend.integer.alias.decimal,
				augend.integer.alias.hex,
				augend.date.alias["%Y/%m/%d"],
				augend.constant.alias.alpha,
				augend.constant.alias.Alpha,
			},
		})
	end,
}
