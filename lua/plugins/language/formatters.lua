return {
	"stevearc/conform.nvim",
	opts = {},
	dependencies = {
		{ "williamboman/mason.nvim", opts = {} },
	},
	config = function()
		local conform = require("conform")

		conform.setup({
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},

			formatters_by_ft = {
				lua = { "stylua" },
				python = { "black", "isort" },
				javascript = { "biome" },
				typescript = { "biome" },
				css = { "biome" },
				html = { "biome" },
				astro = { "biome" },
				bash = { "shfmt" },
				cpp = { "clang-format" },
				c = { "clang-format" },
				javascriptreact = { "biome" },
				typescriptreact = { "biome" },
				json = { "biome" },
				cmake = { "cmake_format" },
				vue = { "prettierd" },
				sql = { "sql_formatter" },
			},

			formatter_bin_paths = { vim.fn.stdpath("data") .. "/mason/bin" },

			formatters_opts = {
				stylua = {
					column_width = 100,
					indent_width = 4,
					break_table_items = true,
				},

				black = {
					line_length = 100,
				},

				shfmt = {
					indent = 4,
				},
			},
		})

		local registry = require("mason-registry")

		local formatters = {
			"biome",
			"black",
			"clang-format",
			"cmakelang",
			"markdownlint",
			"prettier",
			"prettierd",
			"ruff",
			"shfmt",
			"stylua",
			"taplo",
			"isort",
			"sql-formatter",
		}

		for _, formatter in ipairs(formatters) do
			if registry.has_package(formatter) then
				local pkg = registry.get_package(formatter)
				if not pkg:is_installed() then
					vim.notify("Installing: " .. formatter, vim.log.levels.INFO)

					pkg:install()
				end
			end
		end

		local function format()
			conform.format({ async = true, lsp_format = "fallback" })
		end

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
