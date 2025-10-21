vim.opt.clipboard = "unnamedplus"

vim.g.mapleader = " "
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.list = true

vim.opt.spell = true
vim.opt.spelllang = "en_us,it"

vim.opt.listchars = {
	eol = "⬎",
	tab = "  ",
	trail = "·",
	extends = "",
	precedes = "",
	nbsp = " ",
}

vim.opt.wrap = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.g.deprecation_warnings = true

vim.opt.confirm = true

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99
vim.opt.foldenable = true
vim.opt.foldcolumn = "1"

vim.opt.cursorline = true
vim.opt.scrolloff = 4
vim.opt.sidescrolloff = 8

vim.opt.virtualedit = "block"
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
