require("launch")

vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"lua",
		"astro",
		"html",
		"css",
		"javascript",
		"typescript",
		"javascriptreact",
		"typescriptreact",
		"sh",
		"cs",
		"toml",
		"json",
		"xml",
		"yaml",
		"markdown",
		"python",
		"go",
		"cpp",
		"cmake",
		"htmlangular",
		"gitignore",
		"jsonc",
		"c",
		"s",
		"asm",
		"zig",
		"mdx",
	},

	callback = function()
		vim.treesitter.start()

		vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
		vim.wo[0][0].foldmethod = "expr"
	end,
})
