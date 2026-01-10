local grp = vim.api.nvim_create_augroup("IndentByFiletype", { clear = true })

local function set_indent(spaces, et)
	vim.bo.expandtab = et
	vim.bo.tabstop = spaces
	vim.bo.shiftwidth = spaces
	vim.bo.softtabstop = et and spaces or 0
end

vim.api.nvim_create_autocmd("FileType", {
	group = grp,
	pattern = {
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"json",
		"yaml",
		"toml",
		"astro",
		"css",
		"scss",
		"less",
		"html",
		"markdown",
		"svelte",
		"vue",
		"php",
		"liquid",
		"handlebars",
		"mustache",
		"ejs",
		"pug",
		"xml",
	},
	callback = function()
		set_indent(2, true)
	end,
	desc = "2 spaces for web languages and YAML",
})

vim.api.nvim_create_autocmd("FileType", {
	group = grp,
	pattern = "python",
	callback = function()
		set_indent(4, true)
	end,
	desc = "4 spaces for python",
})

vim.api.nvim_create_autocmd("FileType", {
	group = grp,
	pattern = "make",
	callback = function()
		set_indent(4, false)
	end,
	desc = "TABS for makefiles",
})

vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function()
		vim.cmd([[%s/\s\+$//e]])
	end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = {
		"*.astro",
		"*.html",
		"*.css",
		"*.jsx",
		"*.tsx",
	},

	callback = function()
		vim.cmd([[TailwindAutoSortRun]])
	end,
})

vim.api.nvim_create_autocmd("TermOpen", {
	pattern = "term://*toggleterm#*",
	callback = function()
		vim.opt_local.spell = false
		vim.opt_local.cursorline = false
		vim.opt_local.number = false
		vim.opt_local.relativenumber = false
		vim.opt_local.signcolumn = "no"
	end,
})
