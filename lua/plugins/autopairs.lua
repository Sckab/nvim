return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	config = function()
		local npairs = require("nvim-autopairs")
		npairs.setup({})

		local Rule = require("nvim-autopairs.rule")
		local cond = require("nvim-autopairs.conds")

		npairs.add_rules({
			Rule(" ", " "):with_pair(function(opts)
				local pair = opts.line:sub(opts.col - 1, opts.col)
				return vim.tbl_contains({ "()", "[]", "{}" }, pair)
			end),
			Rule("( ", " )")
				:with_pair(false)
				:with_move(function(opts)
					return opts.prev_char:match(".%)") ~= nil
				end)
				:use_key(")"),
			Rule("{ ", " }")
				:with_pair(false)
				:with_move(function(opts)
					return opts.prev_char:match(".%}") ~= nil
				end)
				:use_key("}"),
			Rule("[ ", " ]")
				:with_pair(false)
				:with_move(function(opts)
					return opts.prev_char:match(".%]") ~= nil
				end)
				:use_key("]"),
		})
	end,
}
