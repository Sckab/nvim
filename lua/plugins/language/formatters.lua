return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		local conform = require("conform")

		conform.setup({
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "black" },
				javascript = { "prettierd" },
				typescript = { "prettierd" },
				css = { "prettierd" },
				html = { "prettierd" },
				astro = { "prettierd" },
				bash = { "shfmt" },
				csharp = { "csharpier" },
				go = { "goimports" },
			},
			formatter_bin_paths = { vim.fn.stdpath("data") .. "/mason/bin" },
			formatters_opts = {
				prettierd = {
					printWidth = 80,
					bracketSameLine = false,
					tabWidth = 4,
					singleQuote = true,
				},
				stylua = {
					column_width = 80,
					indent_width = 4,
					break_table_items = true,
				},
				black = {
					line_length = 80,
				},
				shfmt = {
					indent = 4,
				},
				csharpier = {
					max_line_length = 80,
					indent_size = 4,
				},
			},
		})

		local function format()
			conform.format({ async = true, lsp_format = "fallback" })
		end

		vim.api.nvim_create_autocmd("BufWritePre", {
			callback = format,
			desc = "Format before save",
		})

		vim.api.nvim_create_autocmd("TextChanged", {
			callback = function()
				if vim.v.event and vim.v.event.operator == "put" then
					format()
				end
			end,
			desc = "Format on paste",
		})
	end,
}
