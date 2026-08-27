require("opts")
require("plugins.lazy.lazy")
require("keymaps")
require("autocommands")

vim.cmd("colorscheme kanagawa-dragon")

vim.filetype.add({
	extension = {
		qss = "css",
	},
})

vim.api.nvim_create_user_command("LspStopAll", function()
	local clients = vim.lsp.get_clients and vim.lsp.get_clients() or vim.lsp.get_active_clients()
	vim.lsp.stop_client(clients)
end, {})
