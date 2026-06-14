local indent_group = vim.api.nvim_create_augroup("IndentByFiletype", { clear = true })
local general_editing_group = vim.api.nvim_create_augroup("GeneralEditing", { clear = true })
local number_group = vim.api.nvim_create_augroup("numbertoggle", {})

local function set_indent(spaces, et)
	vim.bo.expandtab = et
	vim.bo.tabstop = spaces
	vim.bo.shiftwidth = spaces
	vim.bo.softtabstop = et and spaces or 0
end

vim.api.nvim_create_autocmd("FileType", {
	group = indent_group,
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
	group = indent_group,
	pattern = "python",
	callback = function()
		set_indent(4, true)
	end,
	desc = "4 spaces for python",
})

vim.api.nvim_create_autocmd("FileType", {
	group = indent_group,
	pattern = "make",
	callback = function()
		set_indent(4, false)
	end,
	desc = "TABS for makefiles",
})

vim.api.nvim_create_autocmd("BufWritePre", {
	group = general_editing_group,
	callback = function()
		vim.cmd([[%s/\s\+$//e]])
	end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
	group = general_editing_group,
	pattern = {
		"*.astro",
		"*.html",
		"*.css",
		"*.jsx",
		"*.tsx",
	},

	callback = function()
		local clients = vim.lsp.get_clients({ bufnr = 0 })

		for _, client in ipairs(clients) do
			if client.name == "tailwindcss" then
				vim.cmd([[TailwindSort]])
				return
			end
		end
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

vim.api.nvim_create_autocmd("FileType", {
	pattern = "codecompanion",
	callback = function()
		vim.wo.number = false
		vim.wo.relativenumber = false
		vim.cmd("RenderMarkdown")
	end,
})

vim.api.nvim_create_autocmd({ "ModeChanged" }, {
	group = general_editing_group,
	callback = function()
		require("lint").try_lint()
	end,
})

vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "WinEnter" }, {
	pattern = "*",
	group = number_group,
	callback = function()
		if vim.o.nu and vim.api.nvim_get_mode().mode ~= "i" then
			vim.opt.relativenumber = true
		end
	end,
})

vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "WinLeave" }, {
	pattern = "*",
	group = number_group,
	callback = function()
		if vim.o.nu then
			vim.opt.relativenumber = false
			if not vim.tbl_contains({ "@", "-" }, vim.v.event.cmdtype) then
				vim.cmd("redraw")
			end
		end
	end,
})
